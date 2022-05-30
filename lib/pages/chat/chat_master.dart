import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/pages/chat/api/stream_api.dart';
import 'package:student_media/pages/chat/screens/chat_home_page.dart';

import 'package:student_media/pages/chat/theme.dart';
import 'package:student_media/pages/chat/widgets/chat_widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamChat(
      client: StreamApi.client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().light,
        darkTheme: AppTheme().dark,
        themeMode: ThemeMode.dark,
        home: ChatHomePage(),
      ),
    );
  }
}
