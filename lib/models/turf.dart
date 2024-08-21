import 'package:flutter/material.dart';

class TurfCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String games;
  final String location;
  final String openHours;
  final String discount;
  final String rating;

  const TurfCard({
    required this.name,
    required this.imageUrl,
    required this.games,
    required this.location,
    required this.openHours,
    required this.discount,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(games, style: const TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(location),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(openHours),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Rating: $rating/5'),
                const Spacer(),
                Text('Discount: $discount'),
              ],
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Book Now'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('More Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
