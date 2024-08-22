import 'package:flutter/material.dart';
import 'package:turfpro/models/turf/turf.dart';
class TurfCard extends StatelessWidget {
  final Turf turf;
  final VoidCallback onTap;

  const TurfCard({required this.turf, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(turf.imageUrl, fit: BoxFit.cover, height: 150, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(turf.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(turf.games),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(turf.location),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Rating: ${turf.rating}/5'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Discount: ${turf.discount}'),
            ),
          ],
        ),
      ),
    );
  }
}