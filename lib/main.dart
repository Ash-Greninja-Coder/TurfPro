import 'package:flutter/material.dart';
import 'package:turfpro/screen/login.dart';
import 'package:turfpro/screen/options.dart'; 
import 'package:turfpro/screen/signup.dart';
import 'package:turfpro/screen/pageload.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData lightTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TurfPro',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: LoadingWidget(
        backgroundTask: _loadData,
        myPage: const OptionScreen(), 
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
    );
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}