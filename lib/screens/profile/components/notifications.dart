// notifications.dart
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<String> notifications = [
    "You order is on your way ",
    "Buy spare parts for your car now at discount of 20 %",
    "Book your service package now to maintain your car performance",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            trailing: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                // Mark notification as read
                setState(() {
                  notifications.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
