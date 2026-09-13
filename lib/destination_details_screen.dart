import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: destination.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: AppColors.backgroundGradient,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                    errorWidget: (_, __, ___) => const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: AppColors.backgroundGradient,
                      ),
                      child: Center(
                        child: Icon(Icons.image_not_supported_outlined,
                            color: Colors.white, size: 42),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 54,
                  left: 18,
                  child: _RoundButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const Positioned(
                  top: 54,
                  right: 18,
                  child: _RoundButton(icon: Icons.favorite_border),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -28),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
                decoration: const BoxDecoration(
                  color: AppColors.pageBackground,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.city,
                                style: const TextStyle(
                                  color: AppColors.dark,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.green, size: 15),
                                  const SizedBox(width: 3),
                                  Text(destination.country,
                                      style: const TextStyle(
                                          color: AppColors.dark, fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _RatingChip(rating: destination.rating),
                            const SizedBox(height: 5),
                            Text('${destination.reviews} reviews',
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    Text(
                      '${destination.city} is a memorable place to explore, with distinctive local culture, beautiful scenery, and experiences worth planning a whole trip around.',
                      style: const TextStyle(
                          color: AppColors.dark, fontSize: 14, height: 1.5),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Read more',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _InfoPill(
                          icon: Icons.wb_sunny_outlined,
                          label: 'Best time to visit',
                          value: 'Mar - Oct',
                        ),
                        const SizedBox(width: 8),
                        _InfoPill(
                          icon: Icons.explore_outlined,
                          label: 'Travel style',
                          value: 'Adventure',
                        ),
                      ],
                    ),
                    const SizedBox(height: 23),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Upcoming tours',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800)),
                        const Text('See all',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 191,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        children: [
                          _TourCard(
                            info: _tourInfo(destination, 0),
                            destination: destination,
                          ),
                          _TourCard(
                            info: _tourInfo(destination, 1),
                            destination: destination,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _RoundButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(width: 42, height: 42, child: Icon(icon, size: 18)),
      ),
    );
  }
}

class _RatingChip extends StatelessWidget {
  final double rating;

  const _RatingChip({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: AppColors.yellow, size: 13),
          const SizedBox(width: 3),
          Text(rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoPill({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.teal, size: 17),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black45, fontSize: 8),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TourInfo {
  final String title;
  final String subtitle;
  final String imageUrl;

  const _TourInfo(this.title, this.subtitle, this.imageUrl);
}

_TourInfo _tourInfo(Destination destination, int index) {
  const tours = <String, List<_TourInfo>>{
    'Rio de Janeiro': [
      _TourInfo('Sugarloaf Sunrise', '4 days  ·  from \$559/person',
          'https://images.unsplash.com/photo-1516306580123-e6e52b1b7b5f?auto=format&fit=crop&w=700&q=85'),
      _TourInfo('Ilha Grande Escape', '6 days  ·  from \$729/person',
          'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?auto=format&fit=crop&w=700&q=85'),
    ],
    'Tokyo': [
      _TourInfo('Neon Nights', '5 days  ·  from \$899/person',
          'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?auto=format&fit=crop&w=700&q=85'),
      _TourInfo('Mount Fuji Trail', '7 days  ·  from \$1,099/person',
          'https://images.unsplash.com/photo-1528360983277-13d401cdc186?auto=format&fit=crop&w=700&q=85'),
    ],
    'Paris': [
      _TourInfo('Left Bank Stroll', '3 days  ·  from \$489/person',
          'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&w=700&q=85'),
      _TourInfo('Versailles Day Trip', '5 days  ·  from \$679/person',
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=700&q=85'),
    ],
    'New York': [
      _TourInfo('Manhattan Icons', '4 days  ·  from \$649/person',
          'https://images.unsplash.com/photo-1496588152823-86ff7695e68f?auto=format&fit=crop&w=700&q=85'),
      _TourInfo('Brooklyn After Dark', '5 days  ·  from \$719/person',
          'https://images.unsplash.com/photo-1534430480872-3498386e7856?auto=format&fit=crop&w=700&q=85'),
    ],
  };

  final destinationTours = tours[destination.city];
  if (destinationTours != null) {
    return destinationTours[index];
  }

  return index == 0
      ? const _TourInfo(
          'Hidden Trails',
          '5 days  ·  from \$659/person',
          'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=700&q=85',
        )
      : const _TourInfo(
          'Coastal Escape',
          '7 days  ·  from \$789/person',
          'https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=700&q=85',
        );
}

class _TourCard extends StatelessWidget {
  final _TourInfo info;
  final Destination destination;

  const _TourCard({required this.info, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: info.imageUrl,
                  height: 95,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              const Positioned(
                top: 7,
                right: 7,
                child: _RoundButton(icon: Icons.favorite_border),
              ),
            ],
          ),
          const SizedBox(height: 6),
            Text(info.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 14,
                fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
            Text(info.subtitle,
              style: const TextStyle(color: AppColors.dark, fontSize: 11)),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.star, size: 13),
              const SizedBox(width: 3),
              Text('${destination.rating}   ${destination.reviews} reviews',
                  style: const TextStyle(color: AppColors.dark, fontSize: 10)),
              const Spacer(),
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                    color: AppColors.dark, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward,
                    color: Colors.white, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}