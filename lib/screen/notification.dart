import 'package:flutter/material.dart';
import 'package:sportsconnect/indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsconnect/colors.dart'; // Import your colors file

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  NotificationPreferencesScreenState createState() => NotificationPreferencesScreenState();
}

class NotificationPreferencesScreenState extends State<NotificationPreferencesScreen> {
  bool _enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    // Determine if the current theme is dark or light
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
              'assets/images/Not.png', // Corrected asset path if necessary
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
              activeColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
              // Optional: Customize the inactive thumb and track colors if needed
              inactiveThumbColor: isDarkMode ? AppColors.darkOutline : AppColors.lightOutline,
              inactiveTrackColor: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveNotificationPreference(_enableNotifications);
                Navigator.pushNamed(context, '/ready');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary, // Button color
              ),
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
