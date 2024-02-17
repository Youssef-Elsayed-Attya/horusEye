import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/data/local/shered_pref.dart';
import 'package:horus_eye/presentation/introduction/onboarding/content_widget.dart';
import 'package:horus_eye/presentation/login/signIn.dart';
import 'package:horus_eye/presentation/login/signUp.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  MyColors color = MyColors();

  PageController _controller = PageController();

  MyFonts font = MyFonts();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) => setState(() {
              value == 2 ? onLastPage = true : onLastPage = false;
            }),
            controller: _controller,
            children: [
              ContentWidget(
                  T1: 'Let\'s scan',
                  T2: 'just scan any piece label to know all details about it ',
                  color: color.DesertSand,
                  image: 'assets/img/drilling-2.jpg'),
              ContentWidget(
                color: color.DesertSand,
                image: 'assets/img/person-talking-to-ancient-mummy.png',
                T1: 'More and More',
                T2: 'chatting with any piece to get more information about it in addition to explore your knowledge',
              ),
              ContentWidget(
                T1: 'Lost !!!',
                  T2: 'using our mapping feature to know where you are and your way to the next destination    ',
                  color: color.DesertSand,
                  image: 'assets/img/Sandy_Ppl-30_Single-11.jpg'),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip
                  TextButton(
                    child: Text(
                      'skip',
                      style: TextStyle(
                          fontSize: 20,
                          color: color.TwilightLavender,
                          fontFamily: font.Khepri),
                    ),
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                  ),

                  //dot indicator
                  SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                          activeDotColor: color.TwilightLavender),
                      controller: _controller,
                      count: 3),

                  // next or done


                  onLastPage == false ?  TextButton(
                    child: Text(
                       'next',
                      style: TextStyle(
                          fontSize: 20,
                          color: color.TwilightLavender,
                          fontFamily: font.Khepri),
                    ),
                    onPressed: () {
                      _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.slowMiddle);

                    },
                  ):  TextButton(
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 20,
                          color: color.TwilightLavender,
                          fontFamily: font.Khepri),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
