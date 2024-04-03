// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:melinda/main.dart';
import 'package:melinda/API/user.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      User().checkUser(context);
    });
    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(24),
            constraints: BoxConstraints(maxWidth: 300),
            child: Image.asset(
              "assets/images/logo_eksid.png",
            )),
      ),
    );
  }
}

