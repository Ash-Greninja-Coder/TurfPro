import 'package:flutter/material.dart';
import 'game_card.dart';

class GameList extends StatelessWidget {
  final List<Game> games;

  const GameList({required this.games, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: games.map((game) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(game.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                game.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                game.price.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: GameCard(
                gameName: game.title,
                color: Colors.blue, // Example color
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
