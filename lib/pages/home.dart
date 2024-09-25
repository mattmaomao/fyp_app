// pages/home.dart
import 'package:flutter/material.dart';
import 'archery_intro.dart';
import 'slow_mo_cam.dart';
import 'delay_cam.dart';
import 'posture_detection.dart';
import 'score_notes.dart';
import 'score_analysis.dart';
import 'timer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildHorizontalBar(
          context,
          'Archery Introduction',
          'assets/func_banner_temp.jpg',
          ArcheryIntroPage(),
        ),
        _buildHorizontalBar(
          context,
          'Slow Motion Camera',
          'assets/func_banner_temp.jpg',
          SlowMoCamPage(),
        ),
        _buildHorizontalBar(
          context,
          'Delay Camera',
          'assets/func_banner_temp.jpg',
          DelayCamPage(),
        ),
        _buildHorizontalBar(
          context,
          'Posture Detection',
          'assets/func_banner_temp.jpg',
          PostureDetectionPage(),
        ),
        _buildHorizontalBar(
          context,
          'Score Notes',
          'assets/func_banner_temp.jpg',
          ScoreNotesPage(),
        ),
        _buildHorizontalBar(
          context,
          'Score Analysis',
          'assets/func_banner_temp.jpg',
          ScoreAnalysisPage(),
        ),
        _buildHorizontalBar(
          context,
          'Timer',
          'assets/func_banner_temp.jpg',
          TimerPage(),
        ),
        // _buildHorizontalBar(
        //   context,
        //   'Temp',
        //   'assets/func_banner_temp.jpg',
        //   TimerPage(),
        // ),
      ],
    );
  }

  Widget _buildHorizontalBar(
      BuildContext context, String text, String imagePath, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          // Slide transition from right to left
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => targetPage,
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
        height: 64,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          // todo: add background image for each function
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.srcOver,
            ),
          ),
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: TextStyle(
                color: Color.fromRGBO(0xEE, 0xEE, 0xEE, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
