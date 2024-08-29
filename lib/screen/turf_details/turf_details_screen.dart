import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'action_buttons.dart';
import 'ameinties_section.dart';
import 'offers_section.dart';
import 'reviews_section.dart';
import 'sports_section.dart';

class TurfDetailsScreen extends StatelessWidget {
  const TurfDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/400x200',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AZCO Games Arena',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Keezhmadam (2km) • 7AM - 11PM • ★ 4.2',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  ActionButtons(),
                  SizedBox(height: 16),
                  SportsSection(),
                  SizedBox(height: 16),
                  AmenitiesSection(),
                  SizedBox(height: 16),
                  OffersSection(),
                  SizedBox(height: 16),
                  Text(
                    'Description provided by the owner',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Azco - The Games Arena has the below mentioned facilities: ...',
                  ),
                  SizedBox(height: 16),
                  ReviewsSection(),
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
          onPressed: () {},
          child: const Text('Book now', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
