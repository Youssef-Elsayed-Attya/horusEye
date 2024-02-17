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
StepState state8 = StepState.indexed;
StepState state9 = StepState.indexed;
StepState state10 = StepState.indexed;

class TourScreen extends StatefulWidget {
  const TourScreen({super.key});

  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  @override
  void initState() {}

  List indexed = [
    state1,
    state2,
    state3,
    state4,
    state5,
    state6,
    state7,
    state8,
    state9,
    state10,
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
              TextButton(
                  onPressed: details.onStepContinue,
                  child: DialogText(
                      data: 'Continue',
                      color: color.TwilightLavender,
                      size: 10,
                      font: fonts.Khepri)),
              TextButton(
                  onPressed: details.onStepCancel,
                  child: DialogText(
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
            _Cstep == 9 ? null : _Cstep += 1;
            indexed[_Cstep - 1] = StepState.complete;
          });
        },
        onStepCancel: () {
          Navigator.pop(context);
        },
        steps: [
          Step(
              state: indexed[0],
              title: DialogText(
                  data:
                      'Calcite Standing Statue of Amenirdis I on Granite Base',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 180,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: AssetImage('assets/img/museum.jpg'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(data: """
This statue showcases Amenirdis I, a God's Wife of Amun during the 25th Dynasty. Her role as
Divine Adoratrice of Amun gave her unparalleled religious and political influence. The statue's
material, calcite, symbolizes purity and eternal beauty, while the granite base signifies strength and
durability, reflecting her enduring legacy.
Interesting Fact: Amenirdis I is depicted in the Osiris-Hekadjet temple, indicating her significant
religious impact. A statue of her is held by the Nubian Museum in Aswan, highlighting her
prominence in Nubian history.
                      """, color: color.Umber, size: 15, font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[1],
              title: DialogText(
                  data:
                      'Granodiorite Seated Statue of Sekhmet with Cartouche of Amenhotep III',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: DialogText(
                color: color.Umber,
                size: 15,
                font: fonts.PlayFair,
                data: """
Representing the lioness goddess Sekhmet, this statue embodies the power and ferocity of the
deity, with the cartouche of Amenhotep III, linking the pharaoh to divine protection. The use of
granodiorite reflects the Egyptians' mastery over hard stones, which was unparalleled in their time.
Interesting Fact: Amenhotep III's reign was marked by extensive building projects and a significant
emphasis on art, making this statue a testament to the period's grandeur and his devotion to
Sekhmet.
 """,
              )),
          Step(
              state: indexed[2],
              title: DialogText(
                  data: 'Diorite Seated Statue of Khafre with Horus Falcon',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 400,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: AssetImage('assets/img/Khasekhemwy.png'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(data: """
The statue of Khafre, protected by the Horus falcon, symbolizes the divine kingship and protection
over Egypt. Crafted from diorite, a material chosen for its durability and beauty, it highlights the
artistic achievement of the Old Kingdom.
Interesting Fact: Khafre's pyramid at Giza is among the most iconic symbols of ancient Egypt, and
his statues, including this one, reflect the grandeur of his reign.
 """, color: color.Umber, size: 15, font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[3],
              title: DialogText(
                  data:
                      'Upper Part of a Colossal Statue of a King (Probably Amenemhat III',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 400,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: AssetImage('assets/img/Hetepheres l_  Queen_.jpg'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """Likely depicting Amenemhat III, this colossal statue fragment showcases the scale of royal
portraiture. Amenemhat III's reign is notable for advancements in engineering and the arts, with this
piece illustrating the artistic sophistication of the Middle Kingdom.
Interesting Fact: His dedication to the Faiyum area and the construction of a temple to Sobek
highlight his innovative approach to governance and worship.""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[4],
              title: DialogText(
                  data: 'Coffin and Mummy of a Gazelle',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 400,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: AssetImage('assets/img/Statue of King Mentuhotep II in the  Jubilee Garment.jpg'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """This exhibit demonstrates the Egyptians' practice of animal mummification, reflecting their beliefs in
the afterlife. The gazelle, possibly a pet or a sacred offering, represents the intimate relationship
between Egyptians and the natural world.
Interesting Fact: The detailed embalming and the preservation of this gazelle underscore the
Egyptians' reverence for animals, viewing them as integral companions in life and death""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[5],
              title: DialogText(
                  data: 'Black Granite Statue of Senusret III',
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
                          """This imposing black granite statue of Senusret III, a Middle Kingdom pharaoh known for his military
expeditions and extensive building projects, embodies the ruler's stern and powerful demeanor. The
choice of black granite conveys strength and eternity, mirroring Senusret III's enduring legacy.
Interesting Fact: Senusret III's reforms in administration and fortifications along Egypt's borders left a
lasting impact on the country's middle period, showcasing his strategic and administrative prowess.""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[6],
              title: DialogText(
                  data:
                      '''Alabaster Jar Inscribed with Tutankhamun's Cartouche ''',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 400,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.fill,
                  //         image: AssetImage('assets/img/Mentumhet.jpg'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """This exquisite alabaster jar, inscribed with the cartouche of Tutankhamun, reflects the artistic
refinement of the Amarna Period. The material, alabaster, was prized for its translucency and
smoothness, symbolizing purity and the pharaoh's divine status.
Interesting Fact: Despite his short reign, Tutankhamun is one of the most famous pharaohs, with his
tomb's discovery in 1922 revealing the wealth and splendor of his era..""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[7],
              title: DialogText(
                  data: '''Gold Mask of Psusennes I ''',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 400,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.fill,
                  //         image: AssetImage('assets/img/Mentumhet.jpg'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """The gold mask of Psusennes I, a 21st Dynasty pharaoh, exemplifies the craftsmanship of ancient
Egyptian goldsmiths. The mask's intricate detailing and lustrous finish highlight the importance of the
afterlife and the belief in the godlike status of the pharaoh.
Interesting Fact: Psusennes I's tomb, rich in gold artifacts, underscores the wealth and artistry of the
Third Intermediate Period, reflecting a continuation of ancient burial practices..""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[8],
              title: DialogText(
                  data: '''Papyrus of Ani (Book of the Dead) ''',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 400,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.fill,
                  //         image: AssetImage('assets/img/Mentumhet.jpg'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """The Papyrus of Ani, a beautifully illustrated Book of the Dead, contains spells and rituals intended to
guide the deceased through the afterlife. Its vibrant illustrations and hieroglyphic texts offer insight
into ancient Egyptian religious beliefs and the complexity of their funerary practices.
Interesting Fact: This document is a crucial source for understanding the Egyptian concept of the
afterlife, showcasing the depth of their spiritual practices..""",
                      color: color.Umber,
                      size: 15,
                      font: fonts.PlayFair),
                ],
              )),
          Step(
              state: indexed[9],
              title: DialogText(
                  data: '''Bust of Nefertiti ''',
                  color: color.TwilightLavender,
                  size: 20,
                  font: fonts.Khepri),
              content: Column(
                children: [
                  // Container(
                  //   height: 400,
                  //   width: 320,
                  //   decoration: BoxDecoration(
                  //       color: color.Umber,
                  //       border: Border.all(color: color.Umber, width: 10),
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(25),
                  //         bottomRight: Radius.circular(25),
                  //         topRight: Radius.circular(25),
                  //       ),
                  //       image: DecorationImage(
                  //         fit: BoxFit.fill,
                  //         image: AssetImage('assets/img/Mentumhet.jpg'),
                  //       )),
                  // ),
                  SizedBox(height: 10),
                  DialogText(
                      data:
                          """Although not located in the Egyptian Museum, the bust of Nefertiti is a significant artifact of ancient
Egypt, symbolizing the period's artistic and cultural achievements. Her bust, renowned for its beauty
and realism, reflects the Amarna Period's emphasis on more naturalistic portrayals of royalty.
Interesting Fact: Nefertiti played a prominent role in the religious revolution alongside her husband,
Akhenaten, promoting the worship of the sun god Aten..""",
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
