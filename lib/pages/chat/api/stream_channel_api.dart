import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/pages/chat/api/stream_api.dart';


class StreamChannelApi {
  static Future<Channel> createChannelWithUsers({
    required String name,
    required String urlImage,
    List<String> idMembers = const [],
    String? idChannel,
  }) async {
    final id = idChannel ?? Uuid().v4();

    final channel = StreamApi.client.channel('messaging', id: id, extraData: {
      'name': name,
      'image': urlImage,
      'members': idMembers,
    });

    await channel.create();
    await channel.watch();
    return channel;
  }
}
