import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/app/func.dart';
import 'package:horus_eye/data/local/shered_pref.dart';
import 'package:horus_eye/models/user_model.dart';
import 'package:horus_eye/presentation/login/signIn.dart';
import 'package:horus_eye/utils/user_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


final _auth = FirebaseAuth.instance;


class _ProfileScreenState extends State<ProfileScreen> {
  XFile? imageFile;
  UserModel user=UserPreferences.getUser();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getImage() async{
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile = pickedImage;
        user=user.copy(imagePath:imageFile!.path );
        setState(() {});
      }
    } catch (e) {
      imageFile = null;
      setState(() {});
      print(e);

    }
  }

  void getImageFromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        final dir=await getApplicationDocumentsDirectory();
        final name=basename(pickedImage.path);
        final imageFile=File("${dir.path}/$name");
        final newImage=await File(pickedImage.path).copy(imageFile.path);
        setState(() {
          imageFile==newImage;
          user=user.copy(imagePath:newImage.path );
        });
      }

    } catch (e) {
      setState(() {
        print('errorrrrrrrrrrrrrrrrrr:${e}');
      });
    }
  }

  List data = ['User Name', 'Email', 'Password'];


  @override
  Widget build(BuildContext context) {
     List User = [
       user.name,
      user.email,
      '**************'
    ];
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                onPressed: () {
                  getImage();
                  imageFile == null? print('image==null'):print('done');
                },
                icon: Icon(Icons.photo_camera_outlined))
          ],
          floating: true,
          stretch: false,
          pinned: false,
          backgroundColor: MyColors().Umber,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
            centerTitle: false,
            background: 
            imageFile == null
                ? Image.asset(
                    Myimg().OldEgypt,
                    fit: BoxFit.cover,
                  )
                : Image.file(File(imageFile!.path)),

          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 3,
          (context, index) {
            return Card(
              elevation: 0,
              color: MyColors().Umber,
              child: ListTile(
                title: Text(
                  data[index],
                  style: TextStyle(
                    fontFamily: MyFonts().MetalMania,
                  ),
                ),
                trailing: Text(
                  User[index],
                  style:
                      TextStyle(fontFamily: MyFonts().PlayFair, fontSize: 15),
                ),
              ),
            );
          },
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: MaterialButton(
              color: MyColors().Umber,
              height: 25,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              minWidth: 200,
              child: Text('Sign Out',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: MyFonts().PlayFair,
                      color: MyColors().DesertSand)),
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
