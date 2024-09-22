import 'package:flutter/material.dart';
import 'package:sportsconnect/screen/more/help_and_support.dart';
import 'package:sportsconnect/screen/profile_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildListTile(
              context,
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/settings');
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HelpAndSupportScreen()));
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.info,
              title: 'About',
              onTap: () {
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.greenAccent),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      onTap: onTap,
    );
  }
}
