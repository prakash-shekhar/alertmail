import 'package:flutter/material.dart';
import 'alert.dart';

class AlertsView extends StatefulWidget {
  const AlertsView({Key? key}) : super(key: key);
  @override
  State<AlertsView> createState() => _AlertsViewState();
}

class _AlertsViewState extends State<AlertsView> {
  List<Alert> alertList = [];
  void addAlert(Alert a){
    alertList.insert(0, a);
  }
  void initState(){
    addAlert(Alert(0, 0.0, DateTime.now()));
    addAlert(Alert(2, 0.5, DateTime.now()));
    addAlert(Alert(1, 0.5, DateTime.now()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Mail"),
        actions: [IconButton(onPressed: () {
          setState(() {
            alertList.clear();
          });
        }, icon: const Icon(Icons.delete_sweep))],
      ),
      body: ListView.builder(
        itemCount: alertList.length,
        itemBuilder: (context, index){
          String action;
          Icon actionIc;
          switch(alertList[index].action){
            case 0: {
              action = "Mailbox Opened";
              actionIc = const Icon(Icons.lock_open);
            } break;
            case 1: {
              action = "Mailbox Closed";
              actionIc = const Icon(Icons.lock);
            } break;
            case 2: {
              action = "Mail placed in Mailbox";
              actionIc = const Icon(Icons.mark_email_unread);
            } break;
            case 3: {
              action = "Mail removed from Mailbox";
              actionIc = const Icon(Icons.mark_email_read);
            } break;
            default: {
              action = "Error";
              actionIc = const Icon(Icons.error);
            }
          }
          return Card(child: ListTile(
            leading: actionIc,
            title: Text(action),
            subtitle: Text(alertList[index].weight.toString()),
            trailing: Text(alertList[index].date.toString()),
          )
          );
        }
      ),
    );
    }
}