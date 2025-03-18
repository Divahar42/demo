import 'package:demo/vv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'signup_screen.dart'; // Import sign-up page
// import 'phone_auth_screen.dart'; // Import Phone Authentication

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<void> _signInWithEmailPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Successfully signed in')));
      Navigator.pushReplacementNamed(
          context, '/home'); // Navigate to home after sign-in
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      _isLoading = false;
    });
  }

  //Sign out method
  Future<void> _signOut() async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : Column(
              children: [
                ElevatedButton(
                  onPressed: _signInWithEmailPassword,
                  child: Text('Sign In'),
                ),
                ElevatedButton(
                  onPressed: _signOut,
                  child: Text('SignOut'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpScreen()),
                    );
                  },
                  child: Text('Don\'t have an account? Create Account'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}