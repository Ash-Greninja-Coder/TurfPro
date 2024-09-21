import 'package:flutter/material.dart';

class ManagerPanelScreen extends StatelessWidget {
  const ManagerPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manager Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome to the Manager Panel!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to View Bookings Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewBookingsScreen()),
                );
              },
              child: const Text('View Bookings'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Manage Turfs Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManageTurfsScreen()),
                );
              },
              child: const Text('Manage Turfs'),
            ),
            // Additional buttons can be added here
          ],
        ),
      ),
    );
  }
}

class ViewBookingsScreen extends StatelessWidget {
  const ViewBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Bookings'),
      ),
      body: const Center(
        child: Text('List of bookings will be displayed here.'),
      ),
    );
  }
}

class ManageTurfsScreen extends StatelessWidget {
  const ManageTurfsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Turfs'),
      ),
      body: const Center(
        child: Text('Turfs management options will be displayed here.'),
      ),
    );
  }
}
