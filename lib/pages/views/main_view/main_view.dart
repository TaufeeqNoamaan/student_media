import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:student_media/pages/views/main_view/home_page.dart';

import 'package:student_media/pages/views/main_view/todo_view/todo_main_page.dart';



import 'package:student_media/pages/views/main_view/blog_view/blog_view_main_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [const HomePage(), const TodoMainPage(), const BlogMainPage()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar( index: currentIndex,
          onTap: onTap,
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
        ),),);
  }
}