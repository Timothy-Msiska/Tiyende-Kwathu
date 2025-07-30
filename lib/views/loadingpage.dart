import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tiyende_kwathu/views/id.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to Homepage after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F1E4), // blue background
      body: Center(
        child: Image(
          image: AssetImage('assets/icons/Logo.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
