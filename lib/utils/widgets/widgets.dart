import 'package:flutter/material.dart';

// Alert Dialog box
class AlertBox extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const AlertBox({Key? key, required this.title, required this.content, required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        
      ],
    );
  }
}