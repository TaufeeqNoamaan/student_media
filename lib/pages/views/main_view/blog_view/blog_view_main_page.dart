import 'package:flutter/material.dart';

class BlogMainPage extends StatelessWidget {
  const BlogMainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite, width: double.maxFinite, color: Colors.red,
      child: Text('Blog view'),
    );
  }
}