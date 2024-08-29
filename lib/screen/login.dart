import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sportsconnect/screen/options.dart'; // Ensure this file exists

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  String? _verificationId;

  void _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // This callback is invoked when the verification code is automatically
        // retrieved and the user is signed in directly.
        await _auth.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OptionScreen()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // This callback is invoked when the verification code has been sent
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // This callback is invoked when the automatic code retrieval times out
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _signInWithPhoneNumber() async {
    if (_verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: _smsController.text,
      );

      try {
        await _auth.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OptionScreen()),
        );
      } catch (e) {
        print('Sign in failed: $e');
        // Handle sign-in error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome back! Please log in to continue.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Phone Number Text Field
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                hintText: 'Enter your phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: const Text('Send Verification Code'),
            ),
            const SizedBox(height: 20),
            if (_verificationId != null) ...[
              TextField(
                controller: _smsController,
                decoration: const InputDecoration(
                  labelText: 'SMS Code',
                  border: OutlineInputBorder(),
                  hintText: 'Enter the verification code',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signInWithPhoneNumber,
                child: const Text('Verify Code'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
