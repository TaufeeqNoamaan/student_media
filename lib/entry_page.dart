import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:student_media/utils/routes/routes.dart';


class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assests/entry_page.png',
                fit: BoxFit.cover,
                height: 325,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Title 1',
                style: TextStyle(color: Colors.white, fontSize: 43),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Text(
                'Title 2',
                style: TextStyle(color: Colors.white, fontSize: 43),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 65),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse rutrum metus volutpat sem imperdiet, sit amet fringilla lectus pharetra. Sed magna ipsum, lacinia quis ante.',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            
            Container( width: 320, padding: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(logInRoute, (route) => false);
              }, child: const Text('Sign In'), style: ButtonStyle(
                elevation: MaterialStateProperty.all(10), 
              ),),
            ),
            Container( width: 320,
              child: ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
              }, child: const Text('Register'),),),
          ],
        ),
      ),
    );
  }
}
