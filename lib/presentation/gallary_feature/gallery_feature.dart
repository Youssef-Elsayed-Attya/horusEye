import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:horus_eye/chatScreen.dart';
import 'package:horus_eye/models/piece_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../ocr_model.dart';

class GalleryFeature extends StatefulWidget {
  GalleryFeature({required this.img});
  XFile img;

  @override
  State<GalleryFeature> createState() => _GalleryFeatureState();
}

class _GalleryFeatureState extends State<GalleryFeature> {


  void getId()async{
    final inputImage=InputImage.fromFilePath(this.widget.img.path);
    final textDetector=GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText=await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText='';
    for(TextBlock block in recognizedText.blocks){
      for(TextLine line in block.lines){
        scannedText =scannedText+ line.text;
      }
    }
  }
  String scannedText='';
  @override
  Widget build(BuildContext context) {
      getId();

    return ChatScreen(piece: allPieces[scannedText]!
    
    );
  }
}
