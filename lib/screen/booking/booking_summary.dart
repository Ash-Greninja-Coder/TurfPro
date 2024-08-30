import 'package:flutter/material.dart';

class BookingSummary extends StatelessWidget {
  const BookingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chosen sport', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Football'),
        SizedBox(height: 16),
        Text('Selected date', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('28/03/2024'),
        SizedBox(height: 16),
        Text('Selected time slot', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('9AM - 10AM'),
        SizedBox(height: 16),
        Text('Selected court size', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Half court'),
      ],
    );
  }
}