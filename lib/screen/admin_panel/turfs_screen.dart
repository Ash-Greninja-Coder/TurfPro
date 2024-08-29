import 'package:flutter/material.dart';
import '../../models/turf/turf.dart';
import '../../models/turf/turf_card.dart';

class TurfsScreen extends StatelessWidget {
  final List<Turf> turfs = [
    Turf(
      name: 'AZCO Games Arena',
      imageUrl: 'https://via.placeholder.com/200',
      games: 'Football, Cricket',
      location: 'Keezhmadam',
      openHours: '7AM - 11PM',
      discount: '10%',
      rating: 4.2,
    ),
    Turf(
      name: 'City Sports Complex',
      imageUrl: 'https://via.placeholder.com/200',
      games: 'Badminton, Tennis',
      location: 'Downtown',
      openHours: '8AM - 10PM',
      discount: '15%',
      rating: 4.0,
    ),
    Turf(
      name: 'Green Turf',
      imageUrl: 'https://via.placeholder.com/200',
      games: 'Cricket',
      location: 'Uptown',
      openHours: '6AM - 9PM',
      discount: '5%',
      rating: 4.5,
    ),
  ];

  TurfsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: turfs.length,
      itemBuilder: (context, index) {
        var turf = turfs[index];
        return TurfCard(turf: turf);
      },
    );
  }
}