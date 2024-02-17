import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:horus_eye/chatGpt.dart';
import 'package:horus_eye/messageForm.dart';
import 'package:horus_eye/models/piece_model.dart';
import 'package:horus_eye/presentation/home/bottomNavagationBar.dart';
import 'package:lottie/lottie.dart';

bool play = false;
bool chatting = false;
bool waiting=false;

List allMessages = [

];

class ChatScreen extends StatefulWidget {
  final PieceModel piece;

  ChatScreen({required this.piece});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String data;

  final FlutterTts flutterTts = FlutterTts();
  TextEditingController Controller = TextEditingController();
  MyColors _colors = MyColors();
  MyFonts _fonts = MyFonts();

  speak() async {
    List<dynamic> languages = await flutterTts.getLanguages;
    List sounds=await flutterTts.getVoices;
    print(sounds);

    data = this.widget.piece.summary;
        //this.widget.piece.summary;
    flutterTts.setLanguage('en');
    flutterTts.getVoices;
    flutterTts.setPitch(1); // 0.5:1.5
    flutterTts.setSpeechRate(0.3);
    play ? flutterTts.speak(data) : flutterTts.pause();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterTts.stop();
  }

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: chatting
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                      chatting = false;
                      allMessages.clear();
                      play=false;
                    },
                    icon: Icon(Icons.close)),
                Column(
                  children: [
                    Container( 
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(this.widget.piece.imagePath)),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(this.widget.piece.name,
                        style: TextStyle(
                            fontSize: 30, fontFamily: MyFonts().MetalMania)),
                  ],
                ),
                chatting
                    ? SizedBox(
                        height: 400,
                        child: Column(
                          children: [
                            MessageStreamBuilder(),
                            waiting? Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                        width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Material(
                                                  elevation: 5,
                                                  borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(30),
                                                      bottomLeft: Radius.circular(30),
                                                      bottomRight: Radius.circular(30)),
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                    child: Lottie.asset('assets/icons/threeDots.json',repeat: true,height: 30),
                                                  )),
                                            ],
                                          ),
                                        ):Container(
                                        ),
                            Container(
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
                                        waiting=true;
                                        setState(() {});
                                        var aiResponse = await GPT(
                                                text: Controller.text,
                                                fullText:
                                                    this.widget.piece.fullText)
                                            .chatGpt();
                                        allMessages.add({
                                          'sender': 'ai',
                                          'content': aiResponse
                                        });
                                        setState(() {
                                          waiting =false;
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
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                controller: Controller,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            width: screenSize.width,
                            height: screenSize.height * .45,
                            child: SingleChildScrollView(
                              child: chatting
                                  ? Container()
                                  : Text(
                                      this.widget.piece.summary,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenSize.width * 0.05,
                                          fontFamily: MyFonts().PlayFair,
                                          color: MyColors().Cacao),
                                    ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  chatting = !chatting;
                                  setState(() {});
                                },
                                child: Image.asset(
                                  MyIcons().scrollIcon,
                                  width: screenSize.width * .15,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    play = !play;
                                    speak();
                                  });
                                },
                                child: play
                                    ? Image.asset(
                                        MyIcons().pause,
                                        width: screenSize.width * .1,
                                      )
                                    : Image.asset(
                                        MyIcons().video,
                                        width: screenSize.width * .13,
                                      ),
                                shape: CircleBorder(),
                              ).animate(target: play == false ? 1 : 0).rotate(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    allPieces[this.widget.piece.id]!.fav=false;
                                  });
                                },
                                icon: Icon(
                                  this.widget.piece.fav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: this.widget.piece.fav
                                      ? Colors.red :Colors.red,
                                  size: 45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
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
