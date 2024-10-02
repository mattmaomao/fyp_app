// main.dart
import 'package:flutter/material.dart';
import 'package:fyp_app/utils/const_var.dart';
import 'package:fyp_app/pages/home.dart';
import 'package:fyp_app/pages/user.dart';
import 'package:fyp_app/pages/settings.dart';
import 'package:fyp_app/utils/header_with_title.dart';
import 'package:camera/camera.dart';
import 'package:fyp_app/pages/delay_cam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } catch (e) {
    print('Error: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
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
      appBar: HeaderWithTitle(title: _getTitle()),

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
          unselectedItemColor: Colors.black87,
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
        return APP_NAME;
      // User
      case 1:
        return 'Bow Data';
      // Settings
      case 2:
        return 'Settings';
      default:
        return APP_NAME;
    }
  }
}
