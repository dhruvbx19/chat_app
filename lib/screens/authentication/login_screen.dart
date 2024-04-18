// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:chat_application/main.dart';
import 'package:chat_application/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
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
