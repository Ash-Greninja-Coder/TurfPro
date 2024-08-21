import 'package:flutter/material.dart';
import 'game_card.dart';

class GameList extends StatelessWidget {
  const GameList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          GameCard(gameName: 'Game 1', color: Colors.blue),
          SizedBox(width: 10),
          GameCard(gameName: 'Game 2', color: Colors.green),
        ],
      ),
    );
  }
}
