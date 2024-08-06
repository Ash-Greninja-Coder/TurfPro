import 'package:flutter/material.dart';
import 'package:turfpro/colors.dart';

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_soccer,
                    size: 80,
                    color: isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'TurfPro',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? AppColors.lightOnSurface : AppColors.darkOnSurface,
                    ),
                  ),
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
