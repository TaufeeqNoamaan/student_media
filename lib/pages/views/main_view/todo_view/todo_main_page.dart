import 'package:flutter/material.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({ Key? key }) : super(key: key);

  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite, width: double.maxFinite, color: Colors.green,
      child: Text('Todo view'),
    );
  }
}