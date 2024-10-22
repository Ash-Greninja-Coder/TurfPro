import 'package:flutter/material.dart';
import 'booking_summary.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  BookingScreenState createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {
  String selectedSport = 'Football';
  DateTime selectedDate = DateTime.now();
  String selectedTimeSlot = '9 AM - 10 AM';
  bool isFullCourt = false;

  final Color whatsAppGreen = const Color(0xFF25D366);
  final Color whatsAppLightGreen = const Color(0xFF25D366);

  final Map<String, bool> timeSlots = {
    '7 AM - 8 AM': false,
    '8 AM - 9 AM': true,
    '9 AM - 10 AM': false,
    '10 AM - 11 AM': false,
    '11 AM - 12 PM': true,
    '1 PM - 2 PM': false,
    '2 PM - 3 PM': true,
    '3 PM - 4 PM': false,
    '4 PM - 5 PM': false,
    '5 PM - 6 PM': true,
    '6 PM - 7 PM': false,
    '7 PM - 8 PM': false,
    '8 PM - 9 PM': true,
    '9 PM - 10 PM': false,
    '10 PM - 11 PM': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AZCO Gamers Arena'),
        backgroundColor: whatsAppGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your sport',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _buildSportChip('Football', Icons.sports_soccer),
                _buildSportChip('Cricket', Icons.sports_cricket),
                _buildSportChip('Billiards', Icons.sports_handball),
                _buildSportChip('Badminton', Icons.sports_tennis),
                _buildSportChip('Table Tennis', Icons.sports_tennis),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Select date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: '${selectedDate.toLocal()}'.split(' ')[0],
                suffixIcon: Icon(Icons.calendar_today, color: whatsAppGreen),
                border: const OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: whatsAppGreen,
                        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: whatsAppGreen),
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select time slot',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: timeSlots.keys.map((timeSlot) {
                return _buildTimeSlotChip(timeSlot, timeSlots[timeSlot]!);
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select court size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildCourtSizeChip('Half court', false),
                const SizedBox(width: 10),
                _buildCourtSizeChip('Full court', true),
              ],
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payable amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₹1000',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingSummaryPage(
                        selectedSport: selectedSport,
                        selectedDate: selectedDate,
                        selectedTimeSlot: selectedTimeSlot,
                        isFullCourt: isFullCourt,
                        subTotal: 1000,
                        discount: 200,
                        payableAmount: 800,
                        advancePayment: 500,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: whatsAppLightGreen,
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSportChip(String sport, IconData icon) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(sport),
        ],
      ),
      selected: selectedSport == sport,
      onSelected: (selected) {
        setState(() {
          selectedSport = sport;
        });
      },
      selectedColor: whatsAppGreen,
    );
  }

  Widget _buildTimeSlotChip(String timeSlot, bool isFull) {
    return ChoiceChip(
      label: Text(timeSlot),
      selected: selectedTimeSlot == timeSlot,
      onSelected: isFull ? null : (selected) {
        setState(() {
          selectedTimeSlot = timeSlot;
        });
      },
      selectedColor: isFull ? Colors.grey : whatsAppGreen,
    );
  }

  Widget _buildCourtSizeChip(String label, bool isFull) {
    return ChoiceChip(
      label: Text(label),
      selected: isFullCourt == isFull,
      onSelected: (selected) {
        setState(() {
          isFullCourt = isFull;
        });
      },
      selectedColor:whatsAppGreen,
    );
  }
}