import 'package:flutter/material.dart';
import 'select_sport_section.dart';
import 'select_time_slot_section.dart';
import 'select_court_size_section.dart';
//import '../payments/payments_screen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AZCO Games Arena'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SelectSportSection(),
            const SizedBox(height: 16),
            const SelectTimeSlotSection(),
            const SizedBox(height: 16),
            const SelectCourtSizeSection(),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('To pay in advance:', style: TextStyle(fontSize: 16)),
                Text('₹1000', style: TextStyle(fontSize: 16)),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => PaymentScreen()),
                //);
              },
              child: const Text('Continue', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}