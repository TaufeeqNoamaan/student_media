
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:student_media/pages/views/main_view/home_page.dart';
import 'package:student_media/pages/views/main_view/home_page.dart';

import 'package:student_media/pages/views/main_view/todo_view/todo_main_page.dart';
import 'package:student_media/utils/routes/routes.dart';

import 'home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: MenuScreen(), mainScreen: MainScreen(),
      //  style: DrawerStyle.style4,
      borderRadius: 40,
      showShadow: false,
      angle: 0.0,
      drawerShadowsBackgroundColor: Color(0xffECDFDF),
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: const Icon(Icons.menu)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        elevation: 10,
        toolbarHeight: 75,
        title: const Text(
          'Student Media',
          style:
              TextStyle(color: Colors.white, fontSize: 33, letterSpacing: 2.5),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 30),
                child: Container(
                    width: 65,
                    height: 65,
                    child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              chatPageRoute, (route) => false);
                        },
                        child: const Icon(
                          Icons.chat,
                          size: 30,
                        ),
                        elevation: 15)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView(
        children:  [Text('Test Text')],
      ),
    );
  }
}
