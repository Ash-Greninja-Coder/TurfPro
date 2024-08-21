import 'package:flutter/material.dart';
import 'package:turfpro/indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  NotificationPreferencesScreenState createState() => NotificationPreferencesScreenState();
}

class NotificationPreferencesScreenState extends State<NotificationPreferencesScreen> {
  bool _enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const IndicatorWidget(currentStep: 3, totalSteps: 4),
            const SizedBox(height: 20),
            Image.asset(
              'assests/images/Not.png',
              fit: BoxFit.cover,
            ),
            const Text(
              'Would you like to enable notifications?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _enableNotifications,
              onChanged: (bool value) {
                setState(() {
                  _enableNotifications = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveNotificationPreference(_enableNotifications);
                Navigator.pushNamed(context, '/ready');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  void saveNotificationPreference(bool enableNotifications) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notification_preference', enableNotifications);
  }
}
