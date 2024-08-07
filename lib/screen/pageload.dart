import 'package:flutter/material.dart';
import 'package:turfpro/colors.dart';
import 'package:turfpro/header.dart'; // Import the HeaderWidget

class LoadingWidget extends StatelessWidget {
  final Future<void> Function() backgroundTask;
  final Widget myPage;

  const LoadingWidget({
    super.key,
    required this.backgroundTask,
    required this.myPage,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return FutureBuilder(
      future: backgroundTask(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: isDarkMode ? AppColors.darkSurface : AppColors.lightSurface,
            child: const Center( // Removed const from Center
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeaderWidget(), // Keep this as const since it doesn't rely on runtime values
                  SizedBox(height: 20),
                  CircularProgressIndicator(), // Optional: Add a loading spinner
                ],
              ),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return myPage;
          }
        }
      },
    );
  }
}
