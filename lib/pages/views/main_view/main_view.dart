
import 'package:flutter/material.dart';
import 'package:student_media/pages/views/main_view/home_page.dart';

import 'package:student_media/pages/views/main_view/todo_view/todo_main_page.dart';

import 'package:student_media/pages/views/main_view/blog_view/blog_view_main_page.dart';



import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [const HomePage(), const TodoMainPage(),  BlogMainPage()];

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
          bottomNavigationBar: GNav(
              haptic: true,
              onTabChange: onTap,
              rippleColor: Colors.purple,
              hoverColor: Colors.grey,
              color: Colors.grey[800], // unselected icon color
              activeColor: Colors.purple, // selected icon and text color
              iconSize: 30, // tab button icon size
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.symmetric(
                  horizontal: 35, vertical: 17), // tab animation duration
              gap: 8,
              tabs: const [
                GButton(
                  text: 'Home',
                  haptic: true,
                  icon: Icons.home_outlined,
                ),
                GButton(
                  text: 'To-do',
                  haptic: true,
                  icon: Icons.format_list_numbered_outlined,
                ),
                GButton(
                  text: 'Blogs',
                  haptic: true,
                  icon: Icons.library_books_outlined,
                )
              ])),
    );
  }
}








// SalomonBottomBar(
//           duration: Duration(milliseconds: 650),
//           currentIndex: currentIndex,
//           onTap: onTap,
//           items: [
//             SalomonBottomBarItem(
//                 icon: 
//                 title: const Text(''),
//                 selectedColor: Colors.red),
//             SalomonBottomBarItem(
//                 icon: const Icon(, size: 30),
//                 title: const Text(''),
//                 selectedColor: Colors.blue),
//             SalomonBottomBarItem(
//                 icon: const Icon(Icons.library_books_outlined, size: 30),
//                 title: const Text(''),
//                 selectedColor: Colors.green)