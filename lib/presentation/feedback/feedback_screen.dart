import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:horus_eye/data/network/gSheets/feedback_model.dart';
import 'package:horus_eye/data/network/gSheets/google_sheet_api.dart';
import 'package:horus_eye/shared/widgets.dart';

import '../../app/constant.dart';

StepState state1 = StepState.indexed;
StepState state2 = StepState.indexed;
StepState state3 = StepState.indexed;
StepState state4 = StepState.indexed;

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController Q1_Controller = TextEditingController();
  TextEditingController Q2_Controller = TextEditingController();
  TextEditingController SuggestionController = TextEditingController();
  final _auth =FirebaseAuth.instance.currentUser;

  MyColors color = MyColors();

  MyFonts fonts = MyFonts();
  List indexed = [
    state1,
    state2,
    state3,
    state4,
  ];

  String nextState = 'Next';
  int _CurrentStep = 0;
  double finalRating=3;

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(color: color.Umber, boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 10)
          ]),
          height: 60,
          alignment: Alignment.center,
          child: DialogText(
            color: color.DesertSand,
            font: fonts.Khepri,
            size: 20,
            data: 'Maybe Later',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Stepper(
          controlsBuilder: (context, details) {
            return Row(
              children: [
                TextButton(
                    onPressed: details.onStepContinue,
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: color.Umber,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: DialogText(
                            data: nextState,
                            color: color.DesertSand,
                            size: 15,
                            font: fonts.Khepri),
                      ),
                    )),

                // TextButton(onPressed: details.onStepCancel, child: DialogText(
                //     data: 'Cancel',
                //     color: color.TwilightLavender,
                //     size: 10,
                //     font: fonts.Khepri))
              ],
            );
          },
          connectorColor:
              MaterialStateColor.resolveWith((states) => color.Umber),
          currentStep: _CurrentStep,
          onStepContinue: () async {
            if(nextState=='Next'){
              setState(() {
                _CurrentStep == 3 ? null : _CurrentStep += 1;
                indexed[_CurrentStep - 1] = StepState.complete;
              });
            }else if(nextState=='Submit'){
              final feedback={
                FeedbackFields.name :_auth!.displayName,
                FeedbackFields.email :_auth!.email,
                FeedbackFields.q1 :Q1_Controller.text,
                FeedbackFields.q2 :Q2_Controller.text,
                FeedbackFields.rate : finalRating,
                FeedbackFields.suggestion : SuggestionController.text,
              };
              await GoogleSheetsApi.insert(feedback).then((value) => print('done'));

            }
            _CurrentStep == 3 ? nextState = 'Submit' : nextState = 'Next';

          },
          onStepCancel: () {
            Navigator.pop(context);
          },
          steps: [
            Step(
                state: indexed[0],
                title: DialogText(
                  data: 'Question 1',
                  font: fonts.MetalMania,
                  color: color.SweetBrown,
                  size: 10,
                ),
                content: Column(
                  children: [
                    DialogText(
                      data:
                          "Q1. On your opinion, what\'s the positive sides in our app ?",
                      font: fonts.PlayFair,
                      size: 20,
                      color: color.Umber,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 5,
                          controller: Q1_Controller,
                          decoration: InputDecoration(
                              helperMaxLines: 3,
                              errorMaxLines: 3,
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: color.Umber)),
                              hintText: 'Answer here',
                              hintStyle: TextStyle(
                                fontFamily: MyFonts().PlayFair,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      width: double.infinity,
                      height: 250,
                    ),
                  ],
                )),
            Step(
                state: indexed[1],
                title: DialogText(
                  data: 'Question 2',
                  font: fonts.MetalMania,
                  color: color.SweetBrown,
                  size: 10,
                ),
                content: Column(
                  children: [
                    DialogText(
                      data:
                          "Q2. On your opinion, what\'s the negative sides in our app ?",
                      font: fonts.PlayFair,
                      size: 20,
                      color: color.Umber,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 5,
                          controller: Q2_Controller,
                          decoration: InputDecoration(
                              helperMaxLines: 3,
                              errorMaxLines: 3,
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: color.Umber)),
                              hintText: 'Answer here',
                              hintStyle: TextStyle(
                                fontFamily: MyFonts().PlayFair,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      width: double.infinity,
                      height: 250,
                    ),
                  ],
                )),
            Step(
              state: indexed[2],
              title: DialogText(
                data: 'Question 3',
                font: fonts.MetalMania,
                color: color.SweetBrown,
                size: 10,
              ),
              content: Column(
                children: [
                  DialogText(
                    data: "How satisfied were you with our app ",
                    font: fonts.PlayFair,
                    size: 20,
                    color: color.Umber,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RatingBar.builder(
                    initialRating: finalRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: color.Umber,
                    ),
                    onRatingUpdate: (rating) {
                      finalRating =rating;
                    },
                  )
                ],
              ),
            ),
            Step(
                state: indexed[3],
                title: DialogText(
                  data: 'Question 4',
                  font: fonts.MetalMania,
                  color: color.SweetBrown,
                  size: 10,
                ),
                content: Column(
                  children: [
                    DialogText(
                      data: "Any Suggestion",
                      font: fonts.PlayFair,
                      size: 15,
                      color: color.Umber,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 5,
                          controller: SuggestionController,
                          decoration: InputDecoration(
                              helperMaxLines: 3,
                              errorMaxLines: 3,
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: color.Umber)),
                              hintText: 'Answer here',
                              hintStyle: TextStyle(
                                fontFamily: MyFonts().PlayFair,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      width: double.infinity,
                      height: 250,
                    ),
                  ],
                )),
          ],
          type: StepperType.horizontal,
        ),
      ),
    );
  }
}
