import 'package:flutter/material.dart';
import 'package:sportsconnect/models/turf/app_bar.dart';
import 'package:sportsconnect/models/turf/bottom_nav.dart';
import 'package:sportsconnect/models/turf/turf_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for turfs, games...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Browse by sports',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChip(label: const Text('Football'), onSelected: (val) {}),
                FilterChip(label: const Text('Cricket'), onSelected: (val) {}),
                FilterChip(label: const Text('Badminton'), onSelected: (val) {}),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Nearby turfs',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  TurfCard(),
                  TurfCard(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nearby games',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  TurfCard(),
                  TurfCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
