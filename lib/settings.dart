import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool darkModeState = false;
  void darkMode(b){
    setState(() {
      darkModeState = b;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 3.0, top: 15.0), child: Text("Mailbox", style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),)),
        Card(child: ListTile(title: Text("Update Device Info..."))),
        Card(child: ListTile(title: Text("Clear Alerts..."))),
        Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 3.0, top: 15.0), child: Text("Appearance", style: TextStyle(color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),)),
        Card(child: ListTile(title: Text("Theme Color"), trailing: Icon(Icons.circle, color: Colors.purple,),)),
      ],),
    );
    }
}