import 'package:flutter/material.dart';

class ConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.red,
          child: Center(
            child: Text(
              "This is Condition Page",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          )),
    );
  }
}
