import 'package:flutter/material.dart';
import 'package:student_media/pages/chat/helpers.dart';
import 'package:student_media/pages/chat/screens/calls_page.dart';
import 'package:student_media/pages/chat/screens/contacts_page.dart';
import 'package:student_media/pages/chat/screens/messages_page.dart';
import 'package:student_media/pages/chat/screens/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_media/pages/chat/theme.dart';
import 'package:student_media/pages/chat/widgets/chat_widgets.dart';

class ChatHomePage extends StatefulWidget {
  ChatHomePage({Key? key}) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');
  final pages = [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: ValueListenableBuilder(
              valueListenable: title,
              builder: (BuildContext context, String value, _) {
                return Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
                icon: Icons.search,
                onTap: () {
                  // TODO: Implement on tap function
                }),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Avatar.small(url: Helpers.randomPictureUrl()),
            )
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          },
        ),
        bottomNavigationBar: _BottomNav(
          onItemSelected: onNavigationItemSelected,
        ),
      ),
    );
  }

  final pagesTitle = ['Messsages', 'Notifications', 'Calls', 'Contacts'];

  void onNavigationItemSelected(index) {
    title.value = pagesTitle[index];
    pageIndex.value = index;
  }
}

class _BottomNav extends StatefulWidget {
  const _BottomNav({Key? key, required this.onItemSelected}) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<_BottomNav> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                label: 'Messages',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                index: 0,
                onTap: handleItemSelected,
                isSelected: (selectedIndex == 0),
              ),
              _NavBarItem(
                label: 'Notifications',
                icon: CupertinoIcons.bell_solid,
                index: 1,
                onTap: handleItemSelected,
                isSelected: (selectedIndex == 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GlowingActionButton(
                    color: AppColors.secondary,
                    icon: CupertinoIcons.add,
                    onPressed: () {
                      // TODO: Implement on tap function
                    }),
              ),
              _NavBarItem(
                label: 'Calls',
                icon: CupertinoIcons.phone_fill,
                index: 2,
                onTap: handleItemSelected,
                isSelected: (selectedIndex == 2),
              ),
              _NavBarItem(
                label: 'Contacts',
                icon: CupertinoIcons.person_2_fill,
                index: 3,
                onTap: handleItemSelected,
                isSelected: (selectedIndex == 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.index,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);
// ** All the arguments
  final ValueChanged<int> onTap;
  final bool isSelected;
  final int index;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 73,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: isSelected
                  ? TextStyle(
                      fontSize: 11,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
