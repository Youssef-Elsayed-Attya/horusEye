import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/chatScreen.dart';
import 'package:horus_eye/models/piece_model.dart';
import 'package:horus_eye/ocr_model.dart';
import 'package:horus_eye/presentation/camera/scan_feature.dart';
import 'package:horus_eye/presentation/feedback/feedback_screen.dart';
import 'package:horus_eye/presentation/gallary_feature/gallery_feature.dart';
import 'package:horus_eye/presentation/horus_eye/horus_eye.dart';
import 'package:horus_eye/presentation/map/map_screen.dart';
import 'package:horus_eye/presentation/musum/musuem.dart';
import 'package:horus_eye/presentation/tour/tour_screen.dart';
import 'package:image_picker/image_picker.dart';

List Co = [
  0xFF54786A,
  0xFFAA5725,
  0xFF624B1C,
  0xFF283d70,
  0xFFc6934b,
  0xFF035290,
  0xFF7c183e,
];
List homeIcons = [
  MyIcons().pyramid,
  MyIcons().tour,
  MyIcons().hieroglyph1,
  MyIcons().history,
  MyIcons().ancientScroll,
  MyIcons().map,
  MyIcons().horusEye2
];
List choise = [
  "camera",
  "tour",
  "gallery",
  "Museum ",
  "Feedback",
  "Map",
  "Horus eye",
];
String pieceId = 'JE 32161';
XFile? imageFile;
List NavScreens = [
  ChatScreen(piece: allPieces[pieceId]!),
  TourScreen(),
  ChatScreen(piece: allPieces[pieceId]!),
  MuseumScreen(),
  FeedbackScreen(),
  MapScreen(),
  HorusEye(),
];

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RegExp pattern = RegExp(r'JE\s\d+');

  // void getImage() async {
  //   try {
  //     final pickedImage =
  //         await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (pickedImage != null) {
  //       textScanning = true;
  //       imageFile = pickedImage;
  //       setState(() {});
  //       scannedText = await OCR_Model(img: File(imageFile!.path)).postImg();
  //       pieceId = scannedText;
  //       //getRecognisedText(pickedImage);
  //     }
  //   } catch (e) {
  //     textScanning = false;
  //     imageFile = null;
  //     scannedText = 'cannot pickedImage';
  //     setState(() {});
  //     print(e);
  //   }
  // }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = '';
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text;
      }
      pieceId = scannedText;
    }
    setState(() {});
  }

  Future<bool> getImageFromGallery() async {
    pieceId = '';
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile = pickedImage;
        getRecognisedText(pickedImage);
        setState(() {});
      }
    } catch (e) {
      imageFile = null;
      scannedText = 'cannot pickedImage';
      setState(() {});
      print(e);
      return false;
    }
    return true;
  }
    Future<bool> getImageFromCamera() async {
    pieceId = '';
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        imageFile = pickedImage;
        getRecognisedText(pickedImage);
        setState(() {});
      }
    } catch (e) {
      imageFile = null;
      scannedText = 'cannot pickedImage';
      setState(() {});
      print(e);
      return false;
    }
    return true;
  }

  String scannedText = '';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MasonryGridView.builder(
      gridDelegate:
          SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      mainAxisSpacing: 15,
      crossAxisSpacing: 10,
      itemCount: 7,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      shrinkWrap: false,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {

            if (index ==0){
              pieceId = '';
              scannedText = '';
              bool done = await getImageFromCamera();
              setState(() {
                
              });
              Future.delayed(
                Duration(seconds: 2),
                () {
                  print('piece id ${pieceId}');
                  if (done) {
                    print("done");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(piece: allPieces[pieceId]!),
                        )).then((value) => pieceId = '');
                  }
                },
              );
            }
             else if (index == 2) {
              pieceId = '';
              scannedText = '';
              bool done = await getImageFromGallery();
              setState(() {
                
              });
              Future.delayed(
                Duration(seconds: 2),
                () {
                  print('piece id ${pieceId}');
                  if (done) {
                    print("done");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(piece: allPieces[pieceId]!),
                        )).then((value) => pieceId = '');
                  }
                },
              );
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavScreens[index],
                  ));
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(homeIcons[index], width: screenSize.width * 0.15),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  choise[index],
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: MyFonts().Yiroglyphics_ttf,
                      color: MyColors().DesertSand),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  choise[index],
                  style: TextStyle(
                      color: MyColors().DesertSand,
                      fontSize: 30,
                      fontFamily: MyFonts().Khepri_Round_Rough),
                ),
              ],
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    spreadRadius: 2,
                  )
                ],
                color: Color(Co[index]),
                borderRadius: BorderRadius.circular(20)),
            width: screenSize.width * 0.2,
            height: index % 2 == 0
                ? screenSize.height * 0.28
                : screenSize.height * 0.22,
          ),
        );
      },
    );
  }
}
