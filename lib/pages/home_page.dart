import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          items: const <Widget>[
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.format_list_numbered_outlined, size: 30),
            Icon(Icons.library_books_outlined, size: 30),
          ],
         
          backgroundColor: Colors.white,
          height: 58,
          color: Colors.blue,
          buttonBackgroundColor: Colors.redAccent,
          animationDuration: const Duration(milliseconds: 300),
        ),
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
      ),
    );
  }
}
