import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';

class MessageForm extends StatelessWidget {
  MessageForm({this.sender, this.text, required this.currentUser});

  MyColors _colors = MyColors();
  MyFonts _fonts = MyFonts();
  final String? sender;
  final String? text;
  final bool currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            currentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
              elevation: 5,
              borderRadius: currentUser
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))
                  : BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
              color: currentUser ? _colors.Cacao : Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '$text ',
                  style: TextStyle(
                      fontFamily: _fonts.Khepri,
                      fontSize: 16,
                      color: currentUser ? Colors.white : Colors.black),
                ),
              )),
        ],
      ),
    );
  }
}
