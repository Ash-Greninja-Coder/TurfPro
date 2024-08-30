import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sportsconnect/screen/notification.dart';
import 'package:sportsconnect/screen/options.dart';
import 'package:sportsconnect/screen/pageload.dart';
import 'package:sportsconnect/screen/ready.dart';
import 'package:sportsconnect/screen/sportspreference.dart';

// Ensure you replace these with your actual Firebase options
const firebaseConfig = FirebaseOptions(
  apiKey: 'AIzaSyBrCs-B95vpiaeTQfQL3CmJuG9kUd3Zx8M',
  appId: '1:1062810266491:android:247f670fd4cd2e7045abde',
  messagingSenderId: '1062810266491',
  projectId: 'turfpro-77ef7',
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseConfig,
  );
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
      },
    );
  }
}

Future<void> _loadData() async {
  await Future.delayed(const Duration(seconds: 2));
}
