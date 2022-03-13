import 'package:flutter/material.dart';
import 'alerts.dart';
import 'captures.dart';
import 'settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AlertMail());
}

class AlertMail extends StatelessWidget {
  const AlertMail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Mail',
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
