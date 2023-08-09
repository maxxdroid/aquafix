import 'dart:async';
import 'package:flutter/material.dart';
import 'authentication/auth.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  displaySplash() {
    Timer(const Duration(seconds: 3), () async {
      if (AuthMethods().auth.currentUser != null) {
        Navigator.pushReplacementNamed(context, "home");
      } else {
        Navigator.pushReplacementNamed(context, "signIn");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset("assets/images/glogo.png"),
          ),
          const SizedBox(height: 30,),
          const CircularProgressIndicator(),
        ],
      )),
    );
  }
}
