import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';

class ContentWidget extends StatelessWidget {
  ContentWidget({required this.color,required this.image,required this.T1,required this.T2});

  Color color;
  String image;
  String T1;
  String T2;
  MyColors fontcolor = MyColors();
  MyFonts font = MyFonts();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 10,
                    blurRadius: 10
                  )
                ],
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill),
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              T1,
              style: TextStyle(
                  fontSize: 30,
                  color: fontcolor.TwilightLavender,
                  fontWeight: FontWeight.bold,
                  fontFamily: font.PlayFair),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              textAlign:TextAlign.center,
              T2,
              style: TextStyle(
                  fontSize: 20,
                  color: fontcolor.TwilightLavender,
                  fontFamily: font.PlayFair),
            ),
          ],
        ),
      ),
      color: color,
    );
  }
}
