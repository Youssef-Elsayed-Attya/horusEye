import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/chatGpt.dart';
import 'package:horus_eye/messageForm.dart';
import 'package:horus_eye/presentation/home/bottomNavagationBar.dart';
import 'package:lottie/lottie.dart';

class HorusEye extends StatefulWidget {
  const HorusEye({super.key});

  @override
  State<HorusEye> createState() => _HorusEyeState();
}

bool waiting = false;

List allMessages = [];

class _HorusEyeState extends State<HorusEye> {
  TextEditingController Controller = TextEditingController();
  MyColors _colors = MyColors();
  MyFonts _fonts = MyFonts();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors().DutchWhite,
      body: SafeArea(
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage(Myimg().prchement_background),
          //         fit: BoxFit.fill,
          //         colorFilter:
          //             ColorFilter.mode(MyColors().buff, BlendMode.softLight))),
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.1, vertical: 0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ));

                    allMessages.clear();
                  },
                  icon: Icon(Icons.close)),
              Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/774.jpg')),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Horus ",
                      style: TextStyle(
                          fontSize: 30, fontFamily: MyFonts().MetalMania)),
                ],
              ),
              Expanded(

                child: Column(
                  children: [
                    MessageStreamBuilder(),
                    waiting
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Lottie.asset(
                                          'assets/icons/threeDots.json',
                                          repeat: true,
                                          height: 30),
                                    )),
                              ],
                            ),
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 60,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: _fonts.PlayFair,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () async {
                                allMessages.add({
                                  'sender': 'user',
                                  'content': Controller.text
                                });
                                Controller.clear();
                                waiting = true;
                                setState(() {});
                                var aiResponse = await GPT(
                                        text: Controller.text, fullText: '')
                                    .horusGPT();
                                allMessages.add(
                                    {'sender': 'ai', 'content': aiResponse});
                                setState(() {
                                  waiting = false;
                                });
                              },
                              icon: Icon(
                                Icons.send,
                                color: _colors.buff,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.brown,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        controller: Controller,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  List<Widget> messageWidgets = [];

  @override
  Widget build(BuildContext context) {
    for (var m in allMessages.reversed) {
      final messageSender = m['sender'];
      final messageContent = m['content'];
      final mesasgeWidget = MessageForm(
        sender: messageSender,
        text: messageContent,
        currentUser: messageSender == 'user',
      );
      messageWidgets.add(mesasgeWidget);
    }
    return Expanded(
      child: ListView(
        reverse: true,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: messageWidgets,
      ),
    );
  }
}
