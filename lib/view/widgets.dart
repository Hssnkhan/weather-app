import 'package:flutter/material.dart';

Widget customstyle(style) {
  return style(style: TextStyle(color: Colors.white, fontSize: 18));
}


customIndicator(){
 return Center(
   child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.pink,
                )),
 );
}