import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              "This is History Page",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          )),
    );
  }
}
