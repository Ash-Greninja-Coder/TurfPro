import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(Icons.directions, 'Directions'),
        _buildActionButton(Icons.phone, 'Contact'),
        _buildActionButton(Icons.share, 'Share'),
        _buildActionButton(Icons.favorite_border, 'Save'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.green)),
      ],
    );
  }
}
