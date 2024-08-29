import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Reviews from Google', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('4.2 ★', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text('(235 reviews)', style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 16),
        _buildReview('Sidharth K', 'a year ago', 5, 'Special thanks to the management for ...'),
        _buildReview('Adarsh Thiya', '2 years ago', 4, 'Great playing arena with Artificial ...'),
      ],
    );
  }

  Widget _buildReview(String name, String time, int rating, String comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(name[0]),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(rating, (index) => const Icon(Icons.star, color: Colors.yellow)),
        ),
        const SizedBox(height: 8),
        Text(comment),
        const SizedBox(height: 16),
      ],
    );
  }
}
