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
            context, 'Archery Introduction', 'assets/func_banner_temp.jpg', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArcheryIntroPage()),
          );
        }),
        _buildHorizontalBar(
            context, 'Slow Motion Camera', 'assets/func_banner_temp.jpg', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SlowMoCamPage()),
          );
        }),
        _buildHorizontalBar(
            context, 'Delay Camera', 'assets/func_banner_temp.jpg', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DelayCamPage()),
          );
        }),
        _buildHorizontalBar(
            context, 'Posture Detection', 'assets/func_banner_temp.jpg', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostureDetectionPage()),
          );
        }),
        _buildHorizontalBar(
            context, 'Score Notes', 'assets/func_banner_temp.jpg', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScoreNotesPage()),
          );
        }),
        _buildHorizontalBar(
            context, 'Score Analysis', 'assets/func_banner_temp.jpg', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScoreAnalysisPage()),
          );
        }),
        _buildHorizontalBar(context, 'Timer', 'assets/func_banner_temp.jpg',
            () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TimerPage()),
          );
        }),
        // _buildHorizontalBar(context, 'Temp', 'assets/func_banner_temp.jpg',
        //     () {
        //   // Navigate to Function
        // }),
      ],
    );
  }

  Widget _buildHorizontalBar(
      BuildContext context, String text, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
