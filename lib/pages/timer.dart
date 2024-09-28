// pages/timer.dart
import 'package:flutter/material.dart';
import 'package:fyp_app/utils/header_with_title.dart';
import 'dart:async';
// import 'package:audioplayers/audio_cache.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithTitle(title: 'Timer'),
      body: Center(
        child: Text('Functionality to be implemented'),
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  final int seconds;
  final bool rounded;

  const TimerWidget({required this.seconds, required this.rounded});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _currentSeconds = 0;
  bool _isRunning = false;
  int _prepareTime = 10;
  int _readyTime = 10;
  int _startTime = 120;
  // AudioCache _audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.seconds;
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          // _audioCache.play('beep.mp3');
          if (_prepareTime > 0) {
            _prepareTime--;
          } else if (_readyTime > 0) {
            // _audioCache.play('beep.mp3');
            _readyTime--;
          } else if (_startTime > 0) {
            // _audioCache.play('beep.mp3');
            _startTime--;
          } else {
            // _audioCache.play('beep.mp3');
            _resetTimer();
          }
        }
      });
    });
  }

  void pauseTimer() {
    _timer.cancel();
    _isRunning = false;
  }

  void _resetTimer() {
    _timer.cancel();
    _isRunning = false;
    setState(() {
      _currentSeconds = widget.seconds;
      _prepareTime = 10;
      _readyTime = 10;
      _startTime = 120;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_currentSeconds s'),
        ElevatedButton(
          onPressed: () {
            if (!_isRunning) {
              startTimer();
              _isRunning = true;
            } else {
              pauseTimer();
            }
          },
          child: Text(_isRunning ? 'Pause' : 'Start'),
        ),
        ElevatedButton(
          onPressed: _resetTimer,
          child: Text('Reset'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}