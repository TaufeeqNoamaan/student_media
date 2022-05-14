import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(
                'assests/sign_in.png',
                fit: BoxFit.cover,
                height: 300,
                width: double.maxFinite,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ],
          )),
    );
  }
}
