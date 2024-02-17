import 'package:flutter/material.dart';
import 'package:horus_eye/app/constant.dart';


class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors().DesertSand,
        width: double.infinity,
        alignment: Alignment.center
        ,
         child: Image.asset('assets/img/map.jpg'),
      ) ,
      appBar: AppBar(
        //leading: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: () => Navigator.pop(context),),
        backgroundColor: MyColors().Cacao,
        centerTitle: true,
        title: Text('Map'),
      )
      ,
    );


  }
}
