import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/data/network/firebase_services.dart';
import 'package:horus_eye/presentation/home/bottomNavagationBar.dart';
import 'package:horus_eye/presentation/login/signUp.dart';

import '../../app/func.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();
  GlobalKey<FormState> GKey = GlobalKey();

  FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void dispose() {
    // TODO: implement dispose
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Form(
          key: GKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 60,
                    color: MyColors().DesertSand,
                    fontFamily: MyFonts().MetalMania),
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

                      errorMaxLines: 3,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
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

                      errorStyle: TextStyle(color: Colors.red),
                        errorMaxLines: 3,

                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidden = !hidden;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye)),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
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
              MaterialButton(
                color: Color(0xFFC49665),
                height: 65,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                minWidth: 200,
                child: Text('Sign In',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: MyFonts().PlayFair,
                        color: MyColors().DesertSand)),
                onPressed: () {
                  if (GKey.currentState!.validate()) {
                    _signIn();
                  }else{
                    print('Not valid current state');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontFamily: MyFonts().PlayFair,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));

                      },
                      child: Text(
                        'Sign Up',
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

  void _signIn() async {
    String email = EmailController.text;
    String password = PasswordController.text;

    User? user = await _authService.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('user is successfully created');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavScreen(),));
    } else {
      print('error in SignIn ');
    }
  }
}
