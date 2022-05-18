import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_media/utils/routes/routes.dart';
import 'package:student_media/utils/widgets/widgets.dart';

class ForgotPassWordPage extends StatefulWidget {
  const ForgotPassWordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassWordPage> createState() => _ForgotPassWordPageState();
}

class _ForgotPassWordPageState extends State<ForgotPassWordPage> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
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
            'assests/forgot_password.png',
            fit: BoxFit.cover,
            height: 250,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          // TODO: To insert a caption:  with a sized box
          const SizedBox(
            height: 20,
          ),
          Text(
            "Don't worry we've got you covered",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 20,
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
          // const SizedBox(
          //   height: 15,
          // ),

          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            width: 275,
            child: ElevatedButton(
              onPressed: () async {
                final email = _email.text;

                AlertDialog(
                  title: const Text('Recovery Email Sent'),
                  content: const Text(
                      'Please reset your password with the recovery email sent'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              logInRoute, (route) => false);
                        },
                        child: const Text('Ok'))
                  ],
                );
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email);
              },
              child: const Text('Reset Password'),
            ),
          ),
        ],
      ),
    ));
  }
}
