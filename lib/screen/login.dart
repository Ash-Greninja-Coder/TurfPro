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
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void dispose() {
    _phoneController.dispose();
    _smsController.dispose();
    super.dispose();
  }

  // Function to send OTP
  void _sendOtp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text.trim(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Automatically sign in the user
          await _auth.signInWithCredential(credential);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OptionScreen()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            _errorMessage = 'Verification failed: ${e.message}';
            _isLoading = false; // Stop loading on error
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
            _isLoading = false; // Stop loading after code is sent
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
            _isLoading = false; // Stop loading after timeout
          });
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Unexpected error occurred: $e';
        _isLoading = false; // Stop loading on error
      });
    }
  }

  // Function to verify the OTP
  void _signInWithPhoneNumber() async {
    if (_verificationId != null) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: _smsController.text.trim(), // Trim whitespace
        );

        await _auth.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OptionScreen()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = 'Sign in failed: ${e.message}';
          _isLoading = false; // Stop loading on error
        });
      } catch (e) {
        setState(() {
          _errorMessage = 'Unexpected error occurred: $e';
          _isLoading = false; // Stop loading on error
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Verification ID is null';
      });
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
              onPressed: _isLoading ? null : _sendOtp,
              child: _isLoading 
                ? const CircularProgressIndicator() 
                : const Text('Send Verification Code'),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
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
                onPressed: _isLoading ? null : _signInWithPhoneNumber,
                child: _isLoading 
                  ? const CircularProgressIndicator() 
                  : const Text('Verify Code'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}