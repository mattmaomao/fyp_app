// pages/timer.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_app/utils/header_with_title.dart';
import 'dart:async';

import 'package:provider/provider.dart';
// import 'package:audioplayers/audio_cache.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerData(),
      child: TimerMain(),
    );
  }
}

class TimerData extends ChangeNotifier {
  int _prepSec = 3; //defalut value
  int get prepSec => _prepSec;
  set prepSec(int newValue) {
    _prepSec = newValue;
    notifyListeners();
  }

  int _readySec = 10; //defalut value
  int get readySec => _readySec;
  set readySec(int newValue) {
    _readySec = newValue;
    notifyListeners();
  }

  int _endSec = 120; //defalut value
  int get endSec => _endSec;
  set endSec(int newValue) {
    _endSec = newValue;
    notifyListeners();
  }

  bool _rounded = false; //defalut value
  bool get rounded => _rounded;
  set rounded(bool newValue) {
    _rounded = newValue;
    notifyListeners();
  }
}

class TimerMain extends StatefulWidget {
  @override
  State<TimerMain> createState() => _TimerMainState();
}

class _TimerMainState extends State<TimerMain> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    TimerSetting(),
    TimerCountDown(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithTitle(title: 'Timer'),
      body: Center(
        child: _pages[_currentIndex],
      ),
    );
  }
}

class TimerSetting extends StatefulWidget {
  @override
  State<TimerSetting> createState() => _TimerSettingState();
}

class _TimerSettingState extends State<TimerSetting> {
  final TextEditingController _prepController = TextEditingController();
  final TextEditingController _readyController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _prepController.text = TimerData().prepSec.toString();
    _readyController.text = TimerData().readySec.toString();
    _endController.text = TimerData().endSec.toString();

    return Consumer<TimerData>(
      builder: (context, timerData, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // timer display
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              child: Text(
                '${(timerData.endSec ~/ 60).toString().padLeft(2, '0')} : ${(timerData.endSec % 60).toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 72,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // setting options
            Container(
              margin: EdgeInsets.only(left: 32, right: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: Colors.pink, // debug
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8, // spacing between col
                mainAxisSpacing: 8, // spacing between row
                shrinkWrap: true,
                children: <Widget>[
                  TextField(
                    controller: _prepController,
                    decoration: InputDecoration(
                      helperText: 'prepare time',
                      // hintText: timerData.prepSec.toString(),
                    ),
                    // only accept number input
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    // update the value when the text field changes
                    onChanged: (value) {
                      if (value.isEmpty) {
                        timerData.prepSec = 0;
                        _prepController.text = '0';
                      } else {
                        timerData.prepSec = int.parse(value);
                        _prepController.text = timerData.prepSec.toString();
                      }
                    },
                  ),
                  TextField(
                    controller: _readyController,
                    decoration: InputDecoration(
                      helperText: 'ready time',
                      // hintText: timerData.readySec.toString(),
                    ),
                    // only accept number input
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    // update the value when the text field changes
                    onChanged: (value) {
                      if (value.isEmpty) {
                        timerData.readySec = 0;
                        _readyController.text = '0';
                      } else {
                        timerData.readySec = int.parse(value);
                        _readyController.text = timerData.readySec.toString();
                        ;
                      }
                    },
                  ),
                  TextField(
                    controller: _endController,
                    decoration: InputDecoration(
                      helperText: 'end time',
                      // hintText: timerData.endSec.toString(),
                    ),
                    // only accept number input
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    // update the value when the text field changes
                    onChanged: (value) {
                      if (value.isEmpty) {
                        timerData.endSec = 0;
                        _endController.text = '0';
                      } else {
                        timerData.endSec = int.parse(value);
                        _endController.text = timerData.endSec.toString();
                      }
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Rounded?"),
                        Switch(
                          value: timerData.rounded,
                          onChanged: (value) {
                            timerData.rounded = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // start button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimerCountDown()),
                );
              },
              child: Text('Start Timer'),
            ),
          ],
        );
      },
    );
  }
}

class TimerCountDown extends StatefulWidget {
  // final int seconds;
  // final bool rounded;

  // const TimerCountDown({required this.seconds, required this.rounded});

  @override
  _TimerCountDownState createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  late Timer _timer;
  bool _isRunning = false;
  int _currentSec = 10;
  int _prepareTime = TimerData().prepSec;
  int _readyTime = TimerData().readySec;
  int _endTime = TimerData().endSec;
  // AudioCache _audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    _currentSec = _endTime;
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentSec++;
        // _audioCache.play('beep.mp3');
        if (_prepareTime > 0) {
          _prepareTime--;
        } else if (_readyTime > 0) {
          // _audioCache.play('beep.mp3');
          _readyTime--;
        } else if (_endTime > 0) {
          // _audioCache.play('beep.mp3');
          _endTime--;
        } else {
          // _audioCache.play('beep.mp3');
          _resetTimer();
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
      _currentSec = 0;
      _prepareTime = TimerData().prepSec;
      _readyTime = TimerData().readySec;
      _endTime = TimerData().endSec;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_currentSec s'),
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
