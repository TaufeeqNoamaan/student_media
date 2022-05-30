import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_media/utils/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To recieve the input from the user
  late final TextEditingController _email;
  late final TextEditingController _password;

// Initializing the variables
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

// Disposing the variables from the memory
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Image.asset(
              'assests/sign_in.png',
              fit: BoxFit.cover,
              height: 250,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 25,
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
              height: 20,
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
                  icon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              width: 275,
              child: ElevatedButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;

                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: password);

                 
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(mainPageRoute, (route) => false);
                },
                child: const Text('Sign in'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Not registered?'),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                },
                child: const Text('Register here'))
          ],
        ),
      ),
    );
  }
}
