import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String gameName;
  final Color color;

  const GameCard({required this.gameName, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        color: color,
        child: Center(
          child: Text(
            gameName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
