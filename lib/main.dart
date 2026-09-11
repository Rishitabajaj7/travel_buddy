import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const TravelBuddyApp());
}

class TravelBuddyApp extends StatelessWidget {
  const TravelBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Buddy',
      debugShowCheckedModeBanner: false,
      theme: AppColors.theme(),
      home: const WelcomeScreen(),
    );
  }
}
