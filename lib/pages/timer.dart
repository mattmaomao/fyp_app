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
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      TimerSetting(toTimerSceen: () {
        setState(() {
          _currentIndex = 1;
        });
      }),
      TimerCountDown(
        toTimerSetting: () {
          setState(() {
            _currentIndex = 0;
          });
        },
      ),
    ];
  }

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
  final VoidCallback toTimerSceen;
  TimerSetting({required this.toTimerSceen});

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
                widget.toTimerSceen();
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
  final VoidCallback toTimerSetting;
  TimerCountDown({required this.toTimerSetting});

  @override
  _TimerCountDownState createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  late Timer _timer;
  late TimerData _timerData;
  bool firstInit = false;

  bool _isRunning = false;
  int _displaySec = -1;
  int _currentSec = -1;
  int _prepareTime = -1;
  int _readyTime = -1;
  int _endTime = -1;
  // AudioCache _audioCache = AudioCache();

  @override
  void dispose() {
    if (_isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  void startTimer() {
    _initTimer();
    print('prepare Time: $_prepareTime');
    print('ready Time: $_readyTime');
    print('end Time: $_endTime');
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentSec++;
        // _audioCache.play('beep.mp3');
        if (_prepareTime > 0) {
          _prepareTime--;
          _displaySec = _prepareTime;
        } else if (_readyTime > 0) {
          // _audioCache.play('beep.mp3');
          _readyTime--;
          _displaySec = _readyTime;
        } else if (_endTime > 0) {
          // _audioCache.play('beep.mp3');
          _endTime--;
          _displaySec = _endTime;
        } else {
          // _audioCache.play('beep.mp3');
          _initTimer();
        }
      });
    });
  }

  void pauseTimer() {
    if (_isRunning) {
      _timer.cancel();
    }
    setState(() {
      _isRunning = false;
    });
  }

  void _initTimer() {
    if (_isRunning) {
      _timer.cancel();
    }
    if (!firstInit) {
      resetCounter();
    } else {
      setState(() {
        resetCounter();
      });
    }
  }

  void resetCounter() {
    _isRunning = false;
    _currentSec = 0;
    _prepareTime = _timerData.prepSec;
    _readyTime = _timerData.readySec;
    _endTime = _timerData.endSec;
    _displaySec = _prepareTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerData>(
      builder: (context, timerData, child) {
        _timerData = timerData;
        if (!firstInit) {
          _initTimer();
          firstInit = true;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_displaySec s'),
            ElevatedButton(
              onPressed: () {
                if (!_isRunning) {
                  startTimer();
                } else {
                  pauseTimer();
                }
              },
              child: Text(_isRunning ? 'Pause' : 'Start'),
            ),
            ElevatedButton(
              onPressed: _initTimer,
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }
}
