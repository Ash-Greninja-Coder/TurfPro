import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
          backgroundColor: Colors.green, 
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.book, color: Colors.white), 
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.red,
                  child: Text('1', style: TextStyle(fontSize: 12.0, color: Colors.white)),
                ),
              ),
            ],
          ),
          label: 'Book',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer, color: Colors.white), 
          label: 'Games',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz, color: Colors.white), 
          label: 'More',
        ),
      ],
      currentIndex: 0, 
      selectedItemColor: Colors.white, 
      unselectedItemColor: Colors.white, 
      showUnselectedLabels: true,
      onTap: (index) {
        // Handle navigation based on the selected index
        switch (index) {
          case 0:
            // Navigate to Home
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            // Navigate to Book
            Navigator.pushNamed(context, '/book');
            break;
          case 2:
            // Navigate to Games
            Navigator.pushNamed(context, '/games');
            break;
          case 3:
            // Navigate to More
            Navigator.pushNamed(context, '/more');
            break;
        }
      },
      backgroundColor: Colors.green, 
    );
  }
}
