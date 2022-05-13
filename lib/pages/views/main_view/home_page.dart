import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:student_media/pages/views/main_view/todo_view/todo_main_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: ,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          elevation: 10,
          toolbarHeight: 75,
          title: const Text(
            'Student Media',
            style: TextStyle(
                color: Colors.white, fontSize: 33, letterSpacing: 2.5),
          ),
        ),
      );
 
  }
}
