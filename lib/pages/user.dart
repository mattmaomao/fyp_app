// pages/user.dart
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            itemCount: 5, // 4 preset slots + 1 add button
            itemBuilder: (context, index) {
              if (index < 4) {
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text('Preset ${index + 1}'),
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
