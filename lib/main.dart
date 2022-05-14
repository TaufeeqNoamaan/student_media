import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_media/entry_page.dart';
import 'package:student_media/firebase_options.dart';
import 'package:student_media/pages/views/auth/login_page.dart';
import 'package:student_media/pages/views/auth/register_page.dart';

import 'package:student_media/pages/views/main_view/blog_view/blog_view_main_page.dart';

import 'package:student_media/pages/views/main_view/home_page.dart';
import 'package:student_media/pages/views/main_view/main_view.dart';
import 'package:student_media/utils/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        logInRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        mainPageRoute:(context) => const MainPage(),
        
      },
    );
  }
}
