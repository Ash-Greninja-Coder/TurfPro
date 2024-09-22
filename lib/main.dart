import 'package:flutter/material.dart';
import 'package:sportsconnect/screen/more.dart';
import 'package:sportsconnect/screen/notification.dart';
import 'package:sportsconnect/screen/options.dart';
import 'package:sportsconnect/screen/pageload.dart';
import 'package:sportsconnect/screen/ready.dart';
import 'package:sportsconnect/screen/sportspreference.dart';

import 'screen/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TurfPro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const LoadingWidget(
        backgroundTask: _loadData,
        myPage: OptionScreen(), 
      ),
      routes: {
        '/sports_preferences': (context) => const SportsPreferencesScreen(),
        '/notification_preferences': (context) => const NotificationPreferencesScreen(),
        '/ready': (context) => const ReadyScreen(),
        '/more' : (context)  => const MoreScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

Future<void> _loadData() async {
  await Future.delayed(const Duration(seconds: 2));
}
