import 'package:flutter/material.dart';
import 'package:turfpro/indicator.dart';
import 'package:turfpro/header.dart';

class SportsPreferencesScreen extends StatelessWidget {
  const SportsPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tell Us About Your Sports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 20),
            const IndicatorWidget(currentStep: 2, totalSteps: 4),
            const SizedBox(height: 20),
            const Text(
              'Tell us about your sports interests.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Help us personalize your sports experience by telling us about the sports you enjoy playing.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildSportCard('Football', Icons.sports_soccer),
                  _buildSportCard('Cricket', Icons.sports_cricket),
                  _buildSportCard('Basketball', Icons.sports_basketball),
                  _buildSportCard('Badminton', Icons.sports),
                  _buildSportCard('Swimming', Icons.pool),
                  _buildSportCard('Table Tennis', Icons.sports_tennis_sharp),
                  _buildSportCard('Billiards', Icons.sports_golf),
                  _buildSportCard('Tennis', Icons.sports_tennis),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notification_preferences');
                  },
                  child: const Text('Continue'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: const Text("I'll do this later"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSportCard(String sportName, IconData icon) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30),
              const SizedBox(height: 10),
              Text(
                sportName,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}