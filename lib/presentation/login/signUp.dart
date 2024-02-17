import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/models/user_model.dart';
import 'package:horus_eye/presentation/login/signIn.dart';
import 'package:horus_eye/utils/user_preferences.dart';

import '../../app/func.dart';
import '../../data/network/firebase_services.dart';
import '../home/bottomNavagationBar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  FirebaseAuthService _authService = FirebaseAuthService();
  GlobalKey<FormState> GKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    NameController.dispose();
    EmailController.dispose();
    PasswordController.dispose();
    ConfirmPasswordController.dispose();
    super.dispose();
  }

  bool hidden = true;
  bool ConfirmHidden = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Form(
            key: GKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 60,
                      color: MyColors().DesertSand,
                      fontFamily: MyFonts().MetalMania),
                ),

                // +++++++++++++++++ name TextForm +++++++++++++++++
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: TextFormField(
                      controller: NameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you should enter your name';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontFamily: MyFonts().PlayFair,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Myimg().prchement))),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you should enter an email';
                        } else if (!isValidEmail(value)) {
                          return 'you should enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      controller: EmailController,
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: MyFonts().PlayFair,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Myimg().prchement))),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: TextFormField(
                      obscureText: hidden,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you should enter a password';
                        } else if (!isPasswordValid(value)) {
                          return 'password should has an uppercase, lowercase, number, symbol and has at least 8 characters';
                        } else {
                          return null;
                        }
                      },
                      controller: PasswordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: MyFonts().PlayFair,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Myimg().prchement))),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: TextFormField(
                      obscureText: ConfirmHidden,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you should confirm your password';
                        } else if (value != PasswordController.text.trim()) {
                          return 'wrong password';
                        } else
                          return null;
                      },
                      controller: ConfirmPasswordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ConfirmHidden = !ConfirmHidden;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontFamily: MyFonts().PlayFair,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Myimg().prchement))),
                ),
                MaterialButton(
                  color: Color(0xFFC49665),
                  height: 65,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                  minWidth: 200,
                  child: Text('Sign Up',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: MyFonts().PlayFair,
                          color: MyColors().DesertSand)),
                  onPressed: () {
                    if (GKey.currentState!.validate()) {


                      _signUp();
                    } else {
                      print('Not valid current state');
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account? ',
                      style: TextStyle(
                        fontFamily: MyFonts().PlayFair,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ));
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: MyFonts().PlayFair,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Myimg().BlurBack),
        )),
      ),
    );
  }

  void _signUp() async {
    String email = EmailController.text;
    String password = PasswordController.text;
    String name = NameController.text;
    UserModel userModel = UserModel(name: name, email: email, imagePath: Myimg().OldEgypt, password: password);
    userModel.copy(
        name: name,
        email: email,
        password: password,
        imagePath: Myimg().OldEgypt);

    User? user =
        await _authService.signUpWithEmailAndPassword(email, password, name);
    UserPreferences.setUser(userModel);

    if (user != null) {
      print('user is successfully created');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavScreen(),
          ));
    } else {
      print('error in SignIn ');
    }
  }
}
