import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class email extends StatefulWidget {
  const email({super.key});

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _errorMessage = '';

  Future<void> _signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // Successfully signed up
      // Redirect to another screen or show success message
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? "An error occurred.";
      });
    }
  }

  Future<void> _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // Successfully signed in
      // Redirect to another screen or show success message
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? "An error occurred.";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(
          controller: email,

        ),
        TextFormField(
          controller: password,
        ),
        ElevatedButton(onPressed: (){}, child: Text("login")),
        ElevatedButton(onPressed: (){}, child: Text("signin"))
      ],
      ),
    );
  }
}
