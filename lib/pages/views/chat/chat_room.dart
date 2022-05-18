import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  final Map<String, dynamic> userMap;
  final String chatRoomId;

  final TextEditingController _message = TextEditingController();

  ChatRoom({Key? key, required this.userMap, required this.chatRoomId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat Room Test'),
        ),
        body: Column(
          children: [
            Container(),
          ],
        ),
        bottomNavigationBar: Container(
          height: size.height / 10,
          width: size.width,
          alignment: Alignment.center,
          child: Container(
            height: size.height / 12,
            width: size.width / 1.1,
            child: Row(
              children: [
                Container(
                  height: size.height / 12,
                  width: size.width / 1.5,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
