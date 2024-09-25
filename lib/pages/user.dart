// pages/user.dart
import 'package:flutter/material.dart';
import 'package:fyp_app/pages/bow_preset.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemCount = 2;

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: itemCount, // n preset slots + 1 add button
            itemBuilder: (context, index) {
              if (index < itemCount - 1) {
                return _buildPresetSlot(context, index);
              } else {
                return _buildAddButton(context);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPresetSlot(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          // Slide transition from right to left
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                BowPreset(index: index + 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0); // from right
              var end = Offset.zero; // to top-left
              var curve = Curves.ease;
              // animation
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('Preset ${index + 1}'),
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add new preset logic
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}
