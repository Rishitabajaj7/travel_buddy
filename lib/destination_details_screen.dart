import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'app_theme.dart';
import 'destination.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;

  const DestinationDetailsScreen({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 360,
            pinned: true,
            backgroundColor: AppColors.dark,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                destination.city,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: destination.imageUrl,
                    fit: BoxFit.cover,
                  ),

                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.75),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.country,
                    style: const TextStyle(
                      color: AppColors.coral,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    destination.city,
                    style: const TextStyle(
                      color: AppColors.dark,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.yellow,
                        size: 24,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        '${destination.rating.toStringAsFixed(1)} rating',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        '${destination.reviews} reviews',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'About this destination',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Explore the beauty, culture and experiences of '
                    '${destination.city}. Discover popular places, '
                    'local food and memorable activities during your trip.',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Trip planning feature coming soon!',
                            ),
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Plan this trip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}