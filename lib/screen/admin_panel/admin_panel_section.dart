import 'package:flutter/material.dart';
import 'package:sportsconnect/screen/profile_screen.dart';
import 'payments_screen.dart';
import 'turfs_screen.dart';
import 'managers_screen.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  AdminPanelScreenState createState() => AdminPanelScreenState();
}

class AdminPanelScreenState extends State<AdminPanelScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const PaymentsScreen(),
    TurfsScreen(),
    ManagersScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    // Add your logout logic here
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login screen
  }

  void _showProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()), // Navigate to ProfileScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _showProfile, // Show profile screen on button press
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout, // Logout functionality
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Turfs'),
          BottomNavigationBarItem(icon: Icon(Icons.supervisor_account), label: 'Managers'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
