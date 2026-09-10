import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'login_screen.dart';

void main() => runApp(const TravelBuddyApp());

class TravelBuddyApp extends StatelessWidget {
  const TravelBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Buddy',
      theme: AppColors.theme(),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 24, 22, 22),
          children: [
            Text('TripGlide', style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
            const SizedBox(height: 34),
            Container(
              height: 270,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .12), blurRadius: 16, offset: const Offset(0, 8))],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?auto=format&fit=crop&w=900&q=85',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const DecoratedBox(decoration: BoxDecoration(gradient: AppColors.backgroundGradient)),
                  ),
                  const Align(alignment: Alignment.bottomLeft, child: Padding(padding: EdgeInsets.all(18), child: Text('Your next view is waiting.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)))),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Text('Go somewhere\nworth remembering.', style: const TextStyle(fontSize: 30, height: 1.12, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            const Text('Find beautiful places, plan better trips, and keep every adventure close.', style: TextStyle(color: Colors.black54, fontSize: 12, height: 1.5)),
            const SizedBox(height: 26),
            appButton(context, 'Get started', onPressed: () => openPage(context, const LoginScreen())),
            const SizedBox(height: 8),
            TextButton(onPressed: () => openPage(context, const LoginScreen()), child: const Text('I already have an account')),
          ],
        ),
      ),
    );
  }
}
