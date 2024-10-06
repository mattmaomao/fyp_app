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

  bool _isRoundA = true; //defalut value
  bool get isRoundA => _isRoundA;
  set isRoundA(bool newValue) {
    _isRoundA = newValue;
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
  bool initializedText = false;

  void initText(TimerData timerData) {
    if (initializedText) {
      return;
    }
    initializedText = true;
    _prepController.text = timerData.prepSec.toString();
    _readyController.text = timerData.readySec.toString();
    _endController.text = timerData.endSec.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerData>(
      builder: (context, timerData, child) {
        initText(timerData);

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
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    timerData.endSec.toString().padLeft(4, '0'),
                    style: TextStyle(
                      letterSpacing: 12,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('A',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          )),
                      Text('B',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ],
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
                crossAxisSpacing: 32, // spacing between col
                mainAxisSpacing: 4, // spacing between row
                shrinkWrap: true,
                children: <Widget>[
                  TextField(
                    controller: _prepController,
                    decoration: InputDecoration(
                      labelText: 'Prepare Time',
                      labelStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      suffix: Text('(Sec)', style: TextStyle(fontSize: 12)),
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
                      }
                    },
                  ),
                  TextField(
                    controller: _readyController,
                    decoration: InputDecoration(
                      labelText: 'Ready Time',
                      labelStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      suffix: Text('(Sec)', style: TextStyle(fontSize: 12)),
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
                      }
                    },
                  ),
                  TextField(
                    controller: _endController,
                    decoration: InputDecoration(
                      labelText: 'End Time',
                      labelStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      suffix: Text('(Sec)', style: TextStyle(fontSize: 12)),
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
                      }
                    },
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
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
                ],
              ),
            ),
            // confirm button
            ElevatedButton(
              onPressed: () {
                widget.toTimerSceen();
              },
              child: Text('Confirm'),
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
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
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
        } else if (_timerData.rounded && _timerData.isRoundA) {
          // _audioCache.play('beep.mp3');
          resetCounter();
          _timerData.isRoundA = false;
        } else {
          // _audioCache.play('beep.mp3');
          _timerData.isRoundA = true;
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
    _prepareTime = _timerData.prepSec;
    _readyTime = _timerData.readySec;
    _endTime = _timerData.endSec;
    _displaySec = _prepareTime;

    // auto start again if is round A
    if (_timerData.rounded && _timerData.isRoundA) {
      _isRunning = true;
      _prepareTime = 0;
    }
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

        return Container(
          height: 280,
          decoration: BoxDecoration(
              // color: Colors.cyan, // debug
              ),
          child: Column(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _displaySec.toString().padLeft(4, '0'),
                      style: TextStyle(
                        letterSpacing: 12,
                        fontSize: 80,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(timerData.isRoundA ? 'A' : '',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),
                        Text(timerData.isRoundA ? '' : 'B',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              // buttons
              Container(
                decoration: BoxDecoration(
                    // color: Colors.pink, // debug
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.pink, // debug
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.toTimerSetting();
                      },
                      child: Text('Setting'),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
