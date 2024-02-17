import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';
final MyColors _colors=MyColors();


class DialogText extends StatelessWidget {
  String data;
  Color color ;
  String font;
  double size;
  DialogText({required this.data,required this.color,required this.font,required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(data,
    textAlign: TextAlign.start,
    style: TextStyle(
        color: color,
      fontFamily: font,
      fontSize: size,
    ),

    );
  }
}
