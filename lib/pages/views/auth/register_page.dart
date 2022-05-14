import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_media/utils/routes/routes.dart';
import 'dart:developer' show log;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;

// Initialize email and password fields in the memory
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    super.initState();
  }

// Dispose the email and password from the memory aka free-up the memory
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 50),
              child: const Center(
                child: Text(
                  'Hola',
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 355,
              child: TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  icon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: 355,
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  icon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: 355,
              child: TextField(
                controller: _password,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  icon: const Icon(Icons.key),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              height: 42,
              child: ElevatedButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  final name = _name.text;
                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  log(userCredential.toString());
                },
                child: const Text('Register here'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Already have an account?'),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(logInRoute, (route) => false);
                },
                child: const Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
