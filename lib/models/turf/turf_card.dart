import 'package:flutter/material.dart';
import 'package:sportsconnect/screen/turf_details/turf_details_screen.dart';

class TurfCard extends StatelessWidget {
  const TurfCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://imgs.search.brave.com/EYI5-k0ttSZMbuDVg_DNrxwAfuT9lkRsgAC6yO6JBAQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA3LzE1LzExLzEx/LzM2MF9GXzcxNTEx/MTEwN19rUk1xdXZY/bmgyVU92Yjk1d3BI/bExpcjdkVWhvb3Bj/OC5qcGc',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 115,
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: const Text('Upto 10% off', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12), 
                      ),
                      child: const Center(
                        child: Row(
                          children: [
                            Icon(Icons.star),
                            Text(
                              '4.2',
                              style: TextStyle(color: Colors.white),
                            ),

                          ],
                        )
                      ),
                    ),
                  ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('AZCO Games Arena', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Keezhmadam (2km)'),
                  const Text('7AM - 11PM'),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(Colors.green),
                        ),
                        child: const Text('Book now'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const TurfDetailsScreen(),
                            ),
                          );                        },
                        child: const Text('More details'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 