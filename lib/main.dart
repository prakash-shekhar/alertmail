import 'package:flutter/material.dart';
import 'alerts.dart';
import 'captures.dart';
import 'settings.dart';

void main() {
  runApp(const AlertMail());
}

class AlertMail extends StatelessWidget {
  const AlertMail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Mail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: const AlertMailHome(title: 'Alert Mail'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlertMailHome extends StatefulWidget {
  const AlertMailHome({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<AlertMailHome> createState() => _AlertMailHomeState();
}

class _AlertMailHomeState extends State<AlertMailHome> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: const <Widget>[
          AlertsView(),
          CapturesView(),
          SettingsView()
        ],
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Mail Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Captures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
