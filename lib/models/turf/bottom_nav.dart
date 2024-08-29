import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',backgroundColor: Colors.green),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.book),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.red,
                  child: Text('1', style: TextStyle(fontSize: 12.0)),
                ),
              ),
            ],
          ),
          label: 'Book',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Games'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }
}