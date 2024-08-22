import 'package:flutter/material.dart';


class Game {
  final String image;
  final String title;
  final double price;

  Game({required this.image, required this.title, required this.price});
}



class GameCard extends StatelessWidget {
  final String gameName;
  final Color color;

  const GameCard({required this.gameName, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(8),
      child: Text(
        'Play $gameName',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}