// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:chat_application/main.dart';
import 'package:chat_application/screens/authentication/login_screen.dart';
import 'package:chat_application/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 900),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()),);
    });
  }

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
              left: mq.width * 0.3,
              child: Text('Made with Flutter 💙')),
        ],
      ),
    );
  }
}
