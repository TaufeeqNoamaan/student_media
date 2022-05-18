import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// TODO: Search functionality doesn't work. Try CODE-ALONG

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

//
class _ChatHomeScreenState extends State<ChatHomeScreen> {

  //
 late  Map<String, dynamic> userMap;

  late final TextEditingController _input;

  bool isLoading = false;

  @override
  void initState() {
    _input = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //  late final TextEditingController _search;

// Search function to search users
    void onSearch() async {
      setState(() {
        isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection('users')
          .where("email", isEqualTo: _input.text)
          .get()
          .then(
        (value) {
          setState(() {
            userMap = value.docs[0].data();
            isLoading = false;
          });
        },
      );
    }

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            height: 150,
            width: double.maxFinite,
            // TODO: To implement UI of the top container
            child: const Text('Chat Page UI'),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                height: 55,
                width: 325,
                child: TextField(
                  controller: _input,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Enter user email',
                    // icon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.search,
                  size: 30,
                ),
                onTap: onSearch,
              )
            ],
          ),
          // TODO: To display the results after search
          ListTile(
            onTap: () {},
            title: Text(
              userMap['name'],
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(userMap['email']),
            trailing: Icon(
              Icons.chat,
              color: Colors.black,
            ),
          )
        ],
      ),
    ),);
  }
}
