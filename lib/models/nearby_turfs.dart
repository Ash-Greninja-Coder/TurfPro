import 'package:flutter/material.dart';
import 'turf/turf.dart';
import 'turf/turf_card.dart';

class NearbyTurfs extends StatelessWidget {
  final List<Turf> turfs;

  const NearbyTurfs({required this.turfs, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nearby Turfs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: turfs.length,
          itemBuilder: (context, index) {
            return TurfCard(turf: turfs[index], onTap: () {  },);
          },
        ),
      ],
    );
  }
}