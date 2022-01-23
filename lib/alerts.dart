import 'package:flutter/material.dart';

class AlertsView extends StatefulWidget {
  const AlertsView({Key? key}) : super(key: key);
  @override
  State<AlertsView> createState() => _AlertsViewState();
}

class _AlertsViewState extends State<AlertsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("alerts"),
    );
    }
}