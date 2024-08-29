import 'package:flutter/material.dart';
import 'package:sportsconnect/indicator.dart';
import 'package:sportsconnect/header.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderWidget(), 
            const SizedBox(height: 20),
            const IndicatorWidget(currentStep: 1, totalSteps: 4),
            const SizedBox(height: 20),
            const Text(
              'First things first!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Verify your phone number with a one-time password (OTP)',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                hintText: 'Enter your phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sports_preferences');
                Navigator.pop(context);
              },
              child: const Text('Get OTP'),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
                hintText: 'Enter the OTP sent to your phone',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sports_preferences');

              },
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
