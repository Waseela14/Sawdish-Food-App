import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';
import 'package:fypp/login/login_form.dart';
import 'package:fypp/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;


  @override
  void initState() {
    super.initState();
    // Initialize
    startanimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 5000),
            bottom: animate ? 10 : -300,
            left: animate ? 10 : 10,
            right: animate ? 10 : 10,
            top: animate ? 10 : 10,
            child: const Image(image: AssetImage(splash)),
          ),
        ],
      ),
    );
  }

  Future startanimation() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 3200));

    // Check if user is signed in
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // User is not signed in, navigate to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      // User is signed in, navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }
}
