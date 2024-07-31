// test/welcome_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sportsconnect/main.dart'; // Import your main app file
// Import the specific screen you want to test

void main() {
  testWidgets('WelcomeScreen displays title and navigates to login', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the Welcome screen is displayed.
    expect(find.text('Welcome to SportsConnect'), findsOneWidget); // Adjust the text based on your implementation

    // Verify that the login button exists and tap it.
    expect(find.byType(ElevatedButton), findsOneWidget); // Assuming you have an ElevatedButton for login
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify that the Login screen is displayed.
    expect(find.text('Login'), findsOneWidget); // Adjust based on your LoginScreen implementation
  });
}