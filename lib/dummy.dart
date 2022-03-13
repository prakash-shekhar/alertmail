import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlertsView extends StatefulWidget {
  const AlertsView({Key? key}) : super(key: key);
  @override
  State<AlertsView> createState() => _AlertsViewState();
}

class _AlertsViewState extends State<AlertsView> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Mail"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('alerts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                String action;
                Icon actionIc;
                switch (doc.get('action')) {
                  case 0:
                    {
                      action = "Mailbox Opened";
                      actionIc = const Icon(Icons.lock_open);
                    }
                    break;
                  case 1:
                    {
                      action = "Mailbox Closed";
                      actionIc = const Icon(Icons.lock);
                    }
                    break;
                  case 2:
                    {
                      action = "Mail placed in Mailbox";
                      actionIc = const Icon(Icons.mark_email_unread);
                    }
                    break;
                  case 3:
                    {
                      action = "Mail removed from Mailbox";
                      actionIc = const Icon(Icons.mark_email_read);
                    }
                    break;
                  default:
                    {
                      action = "Error";
                      actionIc = const Icon(Icons.error);
                    }
                }
                return Card(
                    child: ListTile(
                  leading: actionIc,
                  title: Text(action),
                  subtitle: Text(doc.get('weight').toString() + 'kg'),
                  trailing: Text(doc.get('date')),
                ));
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
