import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const _slides = [
    (
      image:
          'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?auto=format&fit=crop&w=900&q=85',
      caption: 'Your next view is waiting.',
    ),
    (
      image:
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=900&q=85',
      caption: 'Find your kind of city.',
    ),
    (
      image:
          'https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=900&q=85',
      caption: 'Make room for the unexpected.',
    ),
  ];

  int _activeSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 24, 22, 22),
          children: [
            const Text('TripGlide', style: AppColors.brand),
            const SizedBox(height: 34),
            Container(
              height: 270,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    // ✅ works on all Flutter 3.x
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: PageView.builder(
                itemCount: _slides.length,
                onPageChanged: (index) => setState(() => _activeSlide = index),
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        slide.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: AppColors.backgroundGradient,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Text(
                            slide.caption,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: _activeSlide == index ? 20 : 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: _activeSlide == index
                        ? AppColors.dark
                        : AppColors.dark.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Go somewhere\nworth remembering.',
              style: AppColors.welcomeTitle,
            ),
            const SizedBox(height: 12),
            const Text(
              'Find beautiful places, plan better trips, and keep every adventure close.',
              style: AppColors.muted,
            ),
            const SizedBox(height: 26),
            appButton(
              context,
              'Get started',
              onPressed: () => openPage(context, const LoginScreen()),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => openPage(context, const LoginScreen()),
              child: const Text('I already have an account'),
            ),
          ],
        ),
      ),
    );
  }
}
