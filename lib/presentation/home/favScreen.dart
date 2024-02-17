import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:horus_eye/chatScreen.dart';
import 'package:horus_eye/app/constant.dart';
import 'package:horus_eye/models/piece_model.dart';


class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favMuseumPieces.length,
      itemBuilder: (context, index) {
      return OpenContainer(
        transitionDuration: Duration(milliseconds: 700),
        transitionType: ContainerTransitionType.fade,

        closedColor: MyColors().DesertSand,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35)
        ),
        closedBuilder: (context, action) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35)
        ),
        elevation: 3,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35)
          ),
          tileColor: MyColors().Umber,
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          //subtitle: Text('this is Scarabaeus',style:TextStyle(fontFamily: MyFonts().PlayFair,color: Colors.grey),),
          isThreeLine: false,
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(favMuseumPieces[index].imagePath)
                )
            ),
          ),
          title: Text(favMuseumPieces[index].name,style: TextStyle(fontFamily: MyFonts().MetalMania,fontSize: 20),),
          trailing: IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.favorite,color: Colors.red),

          ),
        ),), openBuilder: (context, action) => ChatScreen(piece: favMuseumPieces[index]),);
    },);
  }
}


// Card(
// shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
// elevation: 3,
// child: ListTile(
// onTap: () {
//
//
// },
// shape: OutlineInputBorder(
// borderSide: BorderSide.none,
// borderRadius: BorderRadius.circular(25,)
// ),
// tileColor: MyColors().Umber,
// contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
// subtitle: Text('this is Scarabaeus',style:TextStyle(fontFamily: MyFonts().PlayFair,color: Colors.grey),),
// isThreeLine: false,
// leading: Container(
// height: 50,
// width: 50,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// image: DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage(Myimg().Scarabaeus)
// )
// ),
// ),
// title: Text('Scarabaeus',style: TextStyle(fontFamily: MyFonts().MetalMania,fontSize: 20),),
// trailing: IconButton(
// onPressed: () {
//
// },
// icon: Icon(Icons.favorite,color: Colors.red),
//
// ),
// ),),