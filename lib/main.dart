// main.dart
import 'package:flutter/material.dart';
import 'const_var.dart';
import 'pages/home.dart';
import 'pages/user.dart';
import 'pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '<App Name>',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: PRI_COLOR,
          secondary: SEC_COLOR,
        ),
        scaffoldBackgroundColor: BG_COLOR,
      ),
      home: MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    UserPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(
        title: Text(
          _getTitle(), // get current page title
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: DARK_PRI_COLOR,
        shape: Border(
          bottom: BorderSide(
            color: Colors.black38,
            width: 2,
          ),
        ),
      ),

      // content
      body: _pages[_currentIndex],

      // footer nav bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black38,
              width: 2,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: DARK_PRI_COLOR,
          currentIndex: _currentIndex,
          selectedItemColor: SEC_COLOR,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? Icon(Icons.home)
                  : Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? Icon(Icons.person)
                  : Icon(Icons.person_outlined),
              label: 'Bow Data',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? Icon(Icons.settings)
                  : Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  // Get current page title
  String _getTitle() {
    switch (_currentIndex) {
      // Home
      case 0:
        return '<App Name>';
      // User
      case 1:
        return 'Bow Data';
      // Settings
      case 2:
        return 'Settings';
      default:
        return '<App Name>';
    }
  }
}
