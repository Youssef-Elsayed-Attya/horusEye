import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/presentation/home/homeScreen.dart';
import 'package:horus_eye/presentation/home/profileScreen.dart';
import 'package:image_picker/image_picker.dart';

import 'favScreen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  bool textScanning = false;
  XFile? imageFile;
  String scannedText = '';
  String id = '';
  bool hearindex = false;
  int cindex = 0;

  List page = [
    HomeScreen(),
    FavScreen(),
    ProfileScreen(),

  ];

  void getTextFromImage(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = '';
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + '\n';
      }
    }
    textScanning = false;
    setState(() {});
  }

  String getId(scannedText) {
    RegExp text = RegExp(r'je\d+|JE\d+|CG\d+|cg\d+|J.E\d|J E\d');
    var id = text.stringMatch(scannedText);
    print(text.hasMatch(scannedText));
    print(text.stringMatch(scannedText));
    return id ?? 'cant extract id';
  }

  void getImageFromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        getTextFromImage(pickedImage);
        id = getId(scannedText);
        setState(() {});
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      setState(() {
        scannedText = 'error';
      });
      print('errorrrrrrrrrrrrrrrrrr:${e}');
    }
  }

  void getImageFromGallary() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        getTextFromImage(pickedImage);
        id = getId(scannedText);
        setState(() {});
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      setState(() {
        scannedText = 'error';
      });
      print('errorrrrrrrrrrrrrrrrrr:${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   toolbarHeight: 60,
        //   flexibleSpace: FlexibleSpaceBar(
        //     stretchModes: [StretchMode.blurBackground],
        //     centerTitle: true,
        //     expandedTitleScale: 10,
        //     title: Text(
        //       'Welcome, I\'m Horus',
        //       style: TextStyle(
        //         fontSize: 25,
        //           fontFamily: MyFonts().MetalMania, color: Colors.black),
        //     ),
        //   ),
        // ),
        backgroundColor: MyColors().DesertSand,
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (value) {
            setState(() {
              cindex = value;
              value == 1 ? hearindex = true : hearindex = false;
            });
          },
          buttonBackgroundColor: Colors.transparent,
          height: 50,

          backgroundColor: Color(0x00000000),
          color: MyColors().Umber,
          items: [
            Image.asset(
              MyIcons().temple,
              width: screenSize.width * 0.08,
            ),
            !hearindex
                ? Image.asset(
                    MyIcons().heart,

                    width: screenSize.width * 0.08,
                  )
                : Image.asset(
                    MyIcons().horusEye,
                    width: screenSize.width * 0.08,
                  ),
            Image.asset(
              MyIcons().mummy,
              width: screenSize.width * 0.08,
            ),
          ],
        ),
        body: page[cindex],
      ),
    );
  }
}
