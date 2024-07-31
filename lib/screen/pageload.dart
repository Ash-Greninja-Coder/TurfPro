import 'package:flutter/material.dart';

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
    return FutureBuilder(
      future: backgroundTask(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: const Color(0xFFE6FFE6),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_soccer,
                    size: 80,
                    color: Colors.green.shade900,
                  ),
                  const SizedBox(height: 20), 
                  Text( 
                    'TurfPro',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
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