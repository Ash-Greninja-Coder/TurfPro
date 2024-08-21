// lib/widgets/nearby_turfs.dart
import 'package:flutter/material.dart';
import 'turf.dart';

class NearbyTurfs extends StatelessWidget {
  const NearbyTurfs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal, // Horizontal scrolling
      children: const [
        TurfCard(
          name: 'Turf Name 1',
          imageUrl: 'https://via.placeholder.com/400x200',
          games: 'Football, Basketball',
          location: 'Location Address 1',
          openHours: 'Open: 10 AM - 10 PM',
          discount: '20% OFF',
          rating: '4.5',
        ),
        SizedBox(width: 16), // Spacing between cards
        TurfCard(
          name: 'Turf Name 2',
          imageUrl: 'https://via.placeholder.com/400x200',
          games: 'Cricket, Volleyball',
          location: 'Location Address 2',
          openHours: 'Open: 9 AM - 9 PM',
          discount: '10% OFF',
          rating: '4.0',
        ),
        // Add more turf cards here
      ],
    );
  }
}
