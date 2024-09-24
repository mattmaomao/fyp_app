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
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(imagePath),
          //   fit: BoxFit.cover,
          // ),
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
