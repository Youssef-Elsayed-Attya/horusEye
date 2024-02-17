import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horus_eye/presentation/home/bottomNavagationBar.dart';
import 'package:horus_eye/presentation/home/homeScreen.dart';
import 'package:horus_eye/presentation/introduction/onboarding/onboarding_screen.dart';
import 'package:video_player/video_player.dart';
import '../../home/homeScreen.dart';
import 'package:audioplayers/audioplayers.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late VideoPlayerController _controller;
  final player = AudioPlayer();
    final _auth =FirebaseAuth.instance;


  @override
  void initState() {


    Timer(Duration(seconds: 2,),() async{
      await player.play(AssetSource('assets/audio/welcomeIntro.mp3'));
    },);
    // TODO: implement initState
    super.initState();
    _controller= VideoPlayerController.asset('assets/video/eyeofhorus.mp4')..addListener(() {setState(() {

    });})..setLooping(false)..initialize().then((_) => _controller.play());
    Timer(Duration(seconds: 9), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => _auth.currentUser==null ? OnBoardingScreen():BottomNavScreen(),));
    });


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.black,
      body: Container(

        alignment: Alignment.center,
        child: _controller.value.isInitialized ? AspectRatio(aspectRatio: 0.5,child: VideoPlayer(_controller),):Container(),
      ),

    );
  }
}
