// lib/widgets/search_bar.dart
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for turfs, games',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
