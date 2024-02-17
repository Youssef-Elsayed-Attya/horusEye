import 'dart:async';

import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/shared/widgets.dart';


StepState state1 = StepState.indexed;
StepState state2 = StepState.indexed;
StepState state3 = StepState.indexed;
StepState state4 = StepState.indexed;
StepState state5 = StepState.indexed;
StepState state6 = StepState.indexed;
StepState state7 = StepState.indexed;

class MuseumScreen extends StatefulWidget {
  @override
  State<MuseumScreen> createState() => _MuseumScreenState();
}

class _MuseumScreenState extends State<MuseumScreen> {
  @override
  void initState() {}


  List indexed=[
    state1,
    state2,
    state3,
    state4,
    state5,
    state6,
    state7,
  ];
  int _Cstep = 0;
  MyColors color = MyColors();
  MyFonts fonts = MyFonts();
  ScrollController _controller = ScrollController();
  int end = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.DesertSand,
      body: Stepper(
        controlsBuilder: (context, details) {
          return Row(
            children: [
              TextButton(onPressed: details.onStepContinue, child: DialogText(
                  data: 'Continue',
                  color: color.TwilightLavender,
                  size: 10,
                  font: fonts.Khepri)),
              TextButton(onPressed: details.onStepCancel, child: DialogText(
                  data: 'Cancel',
                  color: color.TwilightLavender,
                  size: 10,
                  font: fonts.Khepri))
            ],
          );

        },

        connectorColor: MaterialStateColor.resolveWith((states) => color.Umber),
        connectorThickness: 2,
        onStepContinue: () {
          setState(() {
            _Cstep == 6 ? null : _Cstep += 1;
            indexed[_Cstep-1]=StepState.complete;
          });
        },
        onStepCancel: () {
          Navigator.pop(context);
        },
        steps: [
          Step(
              state: indexed[0],
              title: DialogText(
                  data: 'Museum',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  Container(
                    height: 180,
                    width: 320,
                    decoration: BoxDecoration(
                        color: color.Umber,
                        border: Border.all(color: color.Umber, width: 10),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/museum.jpg'),
                        )),
                  ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """The Egyptian Museum in Cairo (EMC) is the oldest archaeological museum in the Middle East, housing over 170,000 artefacts. It has the largest collection of Pharaonic antiquities in the world. The Museum’s exhibits span the Pre-Dynastic Period till the Graeco-Roman Era (c. 5500 BC - AD 364).A new museum was established at Boulaq in 1858 in a former warehouse, following the foundation of the new Antiquities Department under the direction of Auguste Mariette. The building lay on the bank of the Nile River, and in 1878 it suffered significant damage owing to the flooding of the Nile River. In 1891, the collections were moved to a former royal palace, in the Giza district of Cairo.[3] They remained there until 1902 when they were moved again to the current museum in Tahrir Square, built by the Italian company of Giuseppe Garozzo and Francesco Zaffrani to a design by the French architect Marcel Dourgnon.[4]
In 2004, the museum appointed Wafaa El Saddik as the first female director general.[5]
                      """,
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[1],
              title: DialogText(
                  data: 'Prehistoric times',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: DialogText(
                color: color.Umber,
                size: 15,
                font: fonts.PlayFair,
                data:
                    """Ancient Egypt's prehistoric periods, from the Paleolithic to Chalcolithic (700,000 BC to around 3100 BC), witnessed the evolution of hominids, technological advancements, and the emergence of agriculture. The Chalcolithic era marked the use of copper tools and the rise of hierarchical structures, setting the stage for the dynastic civilization during the Early Dynastic Period (around 3100 BC). This transition marked the shift from prehistoric to historical times in ancient Egypt. """,
              )),
          Step(
              state: indexed[2],
              title: DialogText(
                  data: 'Founding era',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  Container(
                    height: 400,
                    width: 320,
                    decoration: BoxDecoration(
                        color: color.Umber,
                        border: Border.all(color: color.Umber, width: 10),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/Khasekhemwy.png'),
                        )),
                  ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """Ancient Egypt's prehistoric periods, from the Paleolithic to Chalcolithic (700,000 BC to around 3100 BC), witnessed the evolution of hominids, technological advancements, and the emergence of agriculture. The Chalcolithic era marked the use of copper tools and the rise of hierarchical structures, setting the stage for the dynastic civilization during the Early Dynastic Period (around 3100 BC). This transition marked the shift from prehistoric to historical times in ancient Egypt. """,
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[3],
              title: DialogText(
                  data: 'Old Kingdom era',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  Container(
                    height: 400,
                    width: 320,
                    decoration: BoxDecoration(
                        color: color.Umber,
                        border: Border.all(color: color.Umber, width: 10),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/Hetepheres l_  Queen_.jpg'),
                        )),
                  ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """The Old Kingdom era in ancient Egypt (3200–2686 BC) brought a centralized government, hieroglyphic writing, and Memphis as the capital under King Menes. It marked the era of pyramid builders, showcasing cultural achievements such as the Step Pyramid of Djoser. Ruled by families from the Third to the Sixth Dynasty, the Old Kingdom thrived with unique cultural practices and organized maritime navigation.""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[4],
              title: DialogText(
                  data: 'The era of the Middle Kingdom',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  Container(
                    height: 400,
                    width: 320,
                    decoration: BoxDecoration(
                        color: color.Umber,
                        border: Border.all(color: color.Umber, width: 10),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/Statue of King Mentuhotep II in the  Jubilee Garment.jpg'),
                        )),
                  ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """The Middle Kingdom era (2065–1650 BC) in ancient Egypt, led by Pharaoh Mentuhotep II, brought reunification and prosperity after the First Intermediate Period. Rulers like Amenemhat I and III prioritized projects, fostering agricultural and cultural achievements. The subsequent Second Intermediate Period saw a weakened central authority, leading to the Hyksos invasion, a challenging chapter until their expulsion and the rise of the New Kingdom..""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[5],
              title: DialogText(
                  data: 'The New Kingdom era',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  Container(
                    height: 400,
                    width: 320,
                    decoration: BoxDecoration(
                        color: color.Umber,
                        border: Border.all(color: color.Umber, width: 10),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/Tuthmosis III.jpg'),
                        )),
                  ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """The New Kingdom period in ancient Egypt (1580–1150 BC) brought a resurgence after Ahmose I expelled the Hyksos, establishing a modern state. Rulers like Thutmose III and Amenhotep III expanded borders and emphasized education, while Hatshepsut's reign reached cultural and trade peaks. The era featured a religious revolution by Akhenaten and diplomatic success by Ramesses II, leaving a lasting legacy of military conquests and architectural wonders.""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[6],
              title: DialogText(
                  data: 'Late Periods',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  Container(
                    height: 400,
                    width: 320,
                    decoration: BoxDecoration(
                        color: color.Umber,
                        border: Border.all(color: color.Umber, width: 10),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/img/Mentumhet.jpg'),
                        )),
                  ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """The Late Periods in ancient Egypt (664–30 BC) saw foreign invasions, resistance, and cultural blending through the Twenty-Sixth, Persian, and Ptolemaic Dynasties. Alexander the Great's conquest in 332 BC ended the Late Period, ushering in the Ptolemaic dynasty that blended Egyptian and Greek cultures. These periods set the stage for Egypt's eventual integration into the Roman Empire, marked by diverse influences, revolts, and cultural interactions.""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),

        ],
        onStepTapped: (value) {
          setState(() {
            _Cstep = value;

          });
        },
        currentStep: _Cstep,
      ),
    );
  }
}
