import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(
          Icons.directions,
          'Directions',
          () => _openMap(),
        ),
        _buildActionButton(
          Icons.phone,
          'Contact',
          () => _makePhoneCall('+1234567890'),
        ),
        _buildActionButton(
          Icons.share,
          'Share',
          () => _shareTurfInfo(context),
        ),
        _buildActionButton(
          Icons.favorite_border,
          'Save',
          () => _saveTurf(),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  void _openMap() async {
    const String googleMapsUrl = 'https://www.google.com/maps/';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not call $phoneNumber';
    }
  }

  void _shareTurfInfo(BuildContext context) {
    const String turfInfo = 'Check out this turf!';
    final RenderBox box = context.findRenderObject() as RenderBox;

    Share.share(
      turfInfo,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  void _saveTurf() {
    print('Turf saved!');
  }
}
