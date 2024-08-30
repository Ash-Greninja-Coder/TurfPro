import 'package:flutter/material.dart';
import 'package:sportsconnect/models/turf/turf.dart';
import 'package:sportsconnect/screen/booking/booking_screen.dart';
import 'app_bar.dart';
import 'action_buttons.dart';
import 'ameinties_section.dart';
import 'offers_section.dart';
import 'reviews_section.dart';
import 'sports_section.dart';

class TurfDetailsScreen extends StatelessWidget {
  final Turf turf; // Define a field to hold the Turf data

  const TurfDetailsScreen({super.key, required this.turf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              turf.imageUrl, // Use turf.imageUrl
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    turf.name, // Use turf.name
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${turf.location} • ${turf.openHours} • ★ ${turf.rating.toStringAsFixed(1)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const ActionButtons(),
                  const SizedBox(height: 16),
                  const SportsSection(),
                  const SizedBox(height: 16),
                  const AmenitiesSection(),
                  const SizedBox(height: 16),
                  const OffersSection(),
                  const SizedBox(height: 16),
                  const Text(
                    'Description provided by the owner',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Azco - The Games Arena has the below mentioned facilities: ...',
                  ),
                  const SizedBox(height: 16),
                  const ReviewsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingScreen()),
            );
          },
          child: const Text('Book now', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
