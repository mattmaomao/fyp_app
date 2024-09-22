// pages/settings.dart
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Notification Settings'),
          trailing: Switch(
            value: true,
            onChanged: (bool value) {
              // Update notification settings
            },
          ),
        ),
        // ListTile(
        //   title: Text('Dark Mode'),
        //   trailing: Switch(
        //     value: false,
        //     onChanged: (bool value) {
        //       // Update dark mode settings
        //     },
        //   ),
        // ),
        // ListTile(
        //   title: Text('Language'),
        //   trailing: DropdownButton<String>(
        //     value: 'English',
        //     items: <String>['English', 'Spanish', 'French']
        //         .map<DropdownMenuItem<String>>((String value) {
        //       return DropdownMenuItem<String>(
        //         value: value,
        //         child: Text(value),
        //       );
        //     }).toList(),
        //     onChanged: (String? newValue) {
        //       // Update language settings
        //     },
        //   ),
        // ),
      ],
    );
  }
}
