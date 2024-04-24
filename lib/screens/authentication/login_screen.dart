// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:chat_application/main.dart';
import 'package:chat_application/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _handleGoogleBtnClick() {
    _signInWithGoogle().then((user) {
      // log('User: ${user.user}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      ).then((_) {
        print('Navigated to HomeScreen successfully.');
      }).catchError((error) {
        print('Error navigating to HomeScreen: $error');
      });
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          // Once signed in, return the UserCredential
          return await FirebaseAuth.instance.signInWithCredential(credential);
        } else {
          throw FirebaseAuthException(
            code: 'google-auth-error',
            message: 'Failed to obtain authentication details from Google.',
          );
        }
      } else {
        throw FirebaseAuthException(
          code: 'google-sign-in-error',
          message: 'Google sign in failed.',
        );
      }
    } catch (e) {
      // Handle errors here
      print('Error signing in with Google: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text(
          'WeChat',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 5),
            top: mq.height * 0.15,
            width: mq.width * 0.5,
            left: mq.width * 0.25,
            child: Image.asset('assets/chat.png'),
          ),
          Positioned(
            bottom: mq.height * 0.15,
            height: mq.height * 0.07,
            width: mq.width * 0.8,
            left: mq.width * 0.1,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100),
              onPressed: () {
                _handleGoogleBtnClick();
              },
              icon: Image.asset('assets/chat.png'),
              label: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      children: [
                    TextSpan(text: 'LogIn with '),
                    TextSpan(
                        text: 'Google',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
