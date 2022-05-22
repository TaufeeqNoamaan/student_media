import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/pages/chat/stream_api.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final idUser = StreamChat.of(context).currentUser;
    return StreamChannelListView(
      controller: StreamChannelListController(
        client: StreamApi.client,
        limit: 20,
        filter: Filter.custom(value: {
          'members': {
            '\$in': [idUser],
          }
        }),
        sort: [SortOption('last_message_at')],
      ),
    );
  }
}
