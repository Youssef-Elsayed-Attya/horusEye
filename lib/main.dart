import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horus_eye/chatScreen.dart';
import 'package:horus_eye/data/local/shered_pref.dart';
import 'package:horus_eye/data/network/gSheets/google_sheet_api.dart';
import 'package:horus_eye/presentation/home/bottomNavagationBar.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/presentation/home/favScreen.dart';
import 'package:horus_eye/presentation/home/homeScreen.dart';
import 'package:horus_eye/presentation/introduction/onboarding/onboarding_screen.dart';
import 'package:horus_eye/presentation/login/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:horus_eye/presentation/login/signUp.dart';
import 'package:horus_eye/presentation/musum/musuem.dart';
import 'package:horus_eye/utils/user_preferences.dart';
import 'firebase_options.dart';
import 'presentation/introduction/intro/IntroScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSheetsApi.init();
  await UserPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final _auth =FirebaseAuth.instance;

  MyColors _colors=MyColors();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: 'SignIn',
      // routes: {
      //   'Intro': (context) => IntroScreen     (),
      //   'SignIn': (context) => SignInScreen   (),
      //   'SignUp': (context) => SignUpScreen   (),
      //   'Home': (context) => BottomNavScreen  (),
      //   'ChatScreen': (context) => ChatScreen ()
      // },
      home: _auth.currentUser==null ? OnBoardingScreen():BottomNavScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: MyColors().DesertSand,
          ),
          useMaterial3: true,
          colorScheme: ColorScheme.light(background:_colors.DesertSand )),
    );
  }
}
