import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:student_media/pages/chat/stream_api.dart';

class StreamUserApi {
  static Future createUser({
    required String idUser,
    required String userName,
    required String urlImage,
  }) async {
    final token = StreamApi.client.devToken(idUser);

    final user = User(id: idUser, extraData: {
      'name': userName,
      'image': urlImage,
    });
    await StreamApi.client.connectUser(user, token.toString());
  }

  static Future login({required String idUser}) async {
    final token = StreamApi.client.devToken(idUser);

    final user = User(id: idUser);
    await StreamApi.client.connectUser(user, token.toString());
  }
}
