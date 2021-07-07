import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderModel extends StatelessWidget {
  final String? title;
  final String? desc;
  final String? image;

  SliderModel({this.title, this.desc, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image!, width: width * 0.6),
            SizedBox(height: 60),
            Text(title!,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                desc!,
                style: TextStyle(
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.7),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ));
  }
}
