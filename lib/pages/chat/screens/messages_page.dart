import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:student_media/models/chat_models.dart';
import 'package:student_media/pages/chat/helpers.dart';
import 'package:student_media/pages/chat/theme.dart';
import 'package:student_media/pages/chat/widgets/chat_widgets.dart';
import 'package:faker/faker.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Stories(),
        ),
        SliverList(delegate: _delegate()),
      ],
    );
  }

  SliverChildBuilderDelegate _delegate() {
    return SliverChildBuilderDelegate(
      ((context, index) {
        final faker = Faker();
        final date = Helpers.randomDate();

        return MessageTile(
            messageData: MessageData(
                senderName: faker.person.name(),
                message: faker.lorem.sentence(),
                messageDate: date,
                dateMessage: Jiffy(date).fromNow(),
                profilePicture: Helpers.randomPictureUrl()));
      }),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(8),
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 8, bottom: 12),
              child: const Text(
                'Stories',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: AppColors.textFaded),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final faker = Faker();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        child: StoryCard(
                            storyData: StoryData(
                                name: faker.person.name(),
                                url: Helpers.randomPictureUrl())),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
