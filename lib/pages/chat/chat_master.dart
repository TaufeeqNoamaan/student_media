import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/pages/chat/stream_api.dart';
import 'package:student_media/pages/chat/stream_api.dart';
import 'package:student_media/pages/chat/widgets/chat_widgets.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  late final _controller = StreamChannelListController(
    client: StreamApi.client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    sort: const [SortOption('last_message_at')],
  );
  @override
  Widget build(BuildContext context) {
    return StreamChat(
      client: StreamApi.client,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              children: [
                // * This is the 'AppBar' of the chat
                Container(
                  width: double.maxFinite,
                  height: 165,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Colors.indigo,
                  ),
                ),
                // *? This is where all the chats are displayed
    
                StreamChannelListView(controller: _controller,  itemBuilder: (context, channels, index, defaultTile) {
    return ListTile(
      tileColor: Colors.amberAccent,
      title: Center(
        child: StreamChannelName(channel: channels[index]),
      ),
    );
  },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
