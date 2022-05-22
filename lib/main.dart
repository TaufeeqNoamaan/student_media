import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/colors.dart';
import 'package:student_media/entry_page.dart';
import 'package:student_media/firebase_options.dart';
import 'package:student_media/pages/chat/chat_master.dart';
import 'package:student_media/pages/chat/stream_api.dart';
import 'package:student_media/pages/chat/stream_channel_api.dart';
import 'package:student_media/pages/chat/stream_user_api.dart';
import 'package:student_media/pages/views/auth/forgot_password_page.dart';
import 'package:student_media/pages/views/auth/login_page.dart';
import 'package:student_media/pages/views/auth/register_page.dart';

import 'package:student_media/pages/views/main_view/blog_view/blog_view_main_page.dart';

import 'package:student_media/pages/views/main_view/home_page.dart';
import 'package:student_media/pages/views/main_view/main_view.dart';
import 'package:student_media/pages/views/main_view/todo_view/todo_main_page.dart';
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
      theme: ThemeData(colorScheme: lightColorScheme),
     darkTheme: ThemeData(colorScheme: darkColorScheme),
      home: TodoMainPage(),
      routes: {
        logInRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        mainPageRoute: (context) => const MainPage(),
        chatPageRoute: (context) => const ChatHomePage(),
      },
    );
  }
}
