import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/pages/chat/api/stream_api.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late final _controller = StreamUserListController(
    client: StreamApi.client,
    limit: 25,
    filter: Filter.and([
      Filter.notEqual('id', StreamChat.of(context).currentUser!.id),
    ]),
    sort: [
      SortOption(
        'name',
        direction: 1,
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return StreamChat(
        client: StreamApi.client,
        child: Scaffold(
          body: StreamUserListView(
            controller: _controller,
            itemBuilder: (context, users, index, defaultWidget) {
              return Text('data');
            },
          ),
        ));
  }
}
