// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:turfpro/models/game_card.dart';
import 'package:turfpro/models/game_list.dart';
import 'package:turfpro/models/search.dart';
import 'package:turfpro/models/turf/turf.dart';
import 'package:turfpro/models/turf/turf_card.dart';
import 'package:turfpro/models/turf/turf_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Turf> nearbyTurfs = [
      Turf(
        imageUrl: 'https://example.com/turf1.jpg',
        name: 'Chokli Turf',
        games: 'Football, Cricket',
        location: 'Chokli, India',
        openHours: '9 AM - 9 PM',
        rating: 4.5,
        discount: '10% off',
      ),
      Turf(
        imageUrl: 'https://example.com/turf2.jpg',
        name: 'City Turf',
        games: 'Football, Basketball',
        location: 'City Center',
        openHours: '10 AM - 10 PM',
        rating: 4.0,
        discount: '15% off',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.location_on_outlined),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Browse by sports', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GameList(
              games: [
                Game(image: 'assets/images/mob.png', title: 'Soccer', price: 29.99),
                Game(image: 'assets/images/mob.png', title: 'Basketball', price: 19.99),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Nearby Turfs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              shrinkWrap: true, // Prevent overflow
              scrollDirection: Axis.horizontal,
              itemCount: nearbyTurfs.length,
              itemBuilder: (context, index) {
                return TurfCard(
                  turf: nearbyTurfs[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TurfDetailScreen(turf: nearbyTurfs[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
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