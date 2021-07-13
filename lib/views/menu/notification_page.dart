import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.indigoAccent,
          child: Center(
            child: Text(
              "This is Notification Page",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          )),
    );
  }
}
