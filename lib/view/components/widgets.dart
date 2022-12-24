import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomImage extends StatelessWidget {
  final size, url;

  CustomImage({this.url, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: size,
      // child: Image.asset(url),
    );
  }
}

class CustomText extends StatelessWidget {
  final fontWeight, color, text;
  double fontSize;

  CustomText(
      {this.color = Colors.yellow,
      this.fontSize = 13,
      this.fontWeight,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
