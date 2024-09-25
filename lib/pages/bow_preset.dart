// pages/user.dart
import 'package:flutter/material.dart';
import 'package:fyp_app/utils/header_with_title.dart';

class BowPreset extends StatelessWidget {
  final int index;

  BowPreset({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithTitle(title: 'Preset $index'),
      body: Center(
        child: Text('Functionality to be implemented'),
      ),
    );
  }
}
