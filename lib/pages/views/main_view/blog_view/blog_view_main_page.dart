import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:any_link_preview/any_link_preview.dart';
import 'dart:developer' show log;

import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// *! The links won't show up

// ** Have to use Firebase as backend and retrieve the info

class BlogMainPage extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  BlogMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final docRef = db.collection('Database').doc('PagesLinks');
    docRef.snapshots().listen((event) => print("current data: ${event.data()}"),);
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        children: [
          // ** The appbar thingy
          Container(
            width: double.maxFinite,
            height: 200,
          ),
          //* The main body
          //     StreamBuilder(builder: ((context, snapshot) {
          //         DocumentSnapshot snapshot =
          //    db.collection('PagesLink').doc('8kROEB5cnBOrnbLHYKoR').get();
          // var data = snapshot.data() as Map;
          // log(data[1]);
          // return data[1];
          //     } ),),
        ],
      ),
    );
  }
}
