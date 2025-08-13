import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiyende_kwathu/views/loadingpage.dart';  // Assuming SplashScreen is in loadingpage.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure binding before async
  await Firebase.initializeApp();              // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiyende Kwathu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F1E4),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A2F5A)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
