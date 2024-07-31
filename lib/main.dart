import 'package:flutter/material.dart';
import 'package:sportsconnect/screen/login.dart'; 
import 'package:sportsconnect/screen/signup.dart';
import 'package:sportsconnect/screen/pageload.dart'; 

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
        myPage: const LoginScreen(), 
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