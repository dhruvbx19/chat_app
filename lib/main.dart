// ignore_for_file: prefer_const_constructors

import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/screens/authentication/loading_screen.dart';
import 'package:chat_application/screens/authentication/login_screen.dart';
import 'package:chat_application/screens/home_screen.dart';
import 'package:chat_application/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

late Size mq;

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  _initialzedFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 2,
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
      )),
      home: SplashScreen(),
    );
  }
}

_initialzedFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
