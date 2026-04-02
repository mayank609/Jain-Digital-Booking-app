import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const JainDigitalBookingApp());
}

class JainDigitalBookingApp extends StatelessWidget {
  const JainDigitalBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jain Digital Booking',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
