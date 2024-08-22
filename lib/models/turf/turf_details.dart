// lib/screens/turf_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:turfpro/models/turf/turf.dart';

class TurfDetailScreen extends StatelessWidget {
  final Turf turf;

  const TurfDetailScreen({required this.turf, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(turf.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(turf.imageUrl, fit: BoxFit.cover, height: 250, width: double.infinity),
            const SizedBox(height: 16),
            Text(turf.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(turf.games),
            const SizedBox(height: 8),
            Text(turf.location),
            const SizedBox(height: 8),
            Text('Rating: ${turf.rating}/5'),
            const SizedBox(height: 8),
            Text('Discount: ${turf.discount}'),
            const SizedBox(height: 16),
            Text(turf.openHours),
          ],
        ),
      ),
    );
  }
}