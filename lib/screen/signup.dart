import 'package:flutter/material.dart';
import 'package:turfpro/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                    ),
                    filled: true,
                    fillColor: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? AppColors.darkOutline : AppColors.lightOutline,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                    ),
                    filled: true,
                    fillColor: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? AppColors.darkOutline : AppColors.lightOutline,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                    ),
                    filled: true,
                    fillColor: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isDarkMode ? AppColors.darkOutline : AppColors.lightOutline,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {   
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/homepage');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary, // Corrected parameter
                    foregroundColor: isDarkMode ? AppColors.darkOnPrimary : AppColors.lightOnPrimary, // Corrected parameter
                  ),
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
