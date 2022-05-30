import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/colors.dart';
import 'package:student_media/database/db_helper.dart';
import 'package:student_media/entry_page.dart';
import 'package:student_media/firebase_options.dart';
import 'package:student_media/pages/chat/api/stream_api.dart';
import 'package:student_media/pages/chat/chat_master.dart';

import 'package:student_media/pages/views/auth/forgot_password_page.dart';
import 'package:student_media/pages/views/auth/login_page.dart';
import 'package:student_media/pages/views/auth/register_page.dart';

import 'package:student_media/pages/views/main_view/blog_view/blog_view_main_page.dart';

import 'package:student_media/pages/views/main_view/home_page.dart';
import 'package:student_media/pages/views/main_view/main_view.dart';
import 'package:student_media/pages/views/main_view/todo_view/add_tasks.dart';
import 'package:student_media/pages/views/main_view/todo_view/todo_main_page.dart';
import 'package:student_media/utils/routes/routes.dart';

void main() async {
  final client = StreamChatClient(StreamApi.apiKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DBHelper.initDb();

  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}) : super(key: key);

  final StreamChatClient client;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // builder: (BuildContext context, child) {
      //   return StreamChatCore(client: client, child: child!);
      // },
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: lightColorScheme),
      // darkTheme: ThemeData(colorScheme: darkColorScheme),
      home: LoginPage(),

      routes: {
        logInRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        mainPageRoute: (context) => const MainPage(),
        chatPageRoute: (context) => const ChatPage(),
        tasksPageRoute: (context) => const AddTaskPage(),
        mainTasksPageRoute: (context) => const TodoMainPage(),
      },
    );
  }
}
