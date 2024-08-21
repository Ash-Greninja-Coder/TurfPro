// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:turfpro/models/game_list.dart';
import 'package:turfpro/models/nearby_turf.dart';
import 'package:turfpro/models/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.location_on_outlined),
        title: const Column(
          children: [
            Text("Chokli", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text("Updated just now", style: TextStyle(fontSize: 15)),
          ],
        ),
        actions: [
          SizedBox(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.control_point_sharp),
                ),
                const Text("30"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchBar(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Browse by sports', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GameList(),
          NearbyTurfs(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
