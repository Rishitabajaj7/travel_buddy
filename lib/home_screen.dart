import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'app_theme.dart';
import 'bottom_navigation.dart';
import 'destination.dart';
import 'message_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<String> categories = [
    'Asia',
    'Europe',
    'North America',
    'South America',
    'Africa',
    'Australia',
  ];

  static const Map<String, List<Destination>> destinations = {
    'Asia': [
      Destination('Japan', 'Tokyo', 4.9, 842, Icons.location_city),
      Destination('India', 'Jaipur', 4.8, 653, Icons.temple_hindu),
      Destination('Thailand', 'Bangkok', 4.7, 591, Icons.landscape),
    ],
    'Europe': [
      Destination('France', 'Paris', 4.9, 1240, Icons.location_city),
      Destination('Italy', 'Rome', 4.8, 975, Icons.account_balance),
      Destination('Switzerland', 'Interlaken', 5, 701, Icons.terrain),
    ],
    'North America': [
      Destination('USA', 'New York', 4.8, 1112, Icons.location_city),
      Destination('Canada', 'Banff', 4.9, 527, Icons.forest),
      Destination('Mexico', 'Cancún', 4.7, 634, Icons.beach_access),
    ],
    'South America': [
      Destination('Brazil', 'Rio de Janeiro', 5, 143, Icons.beach_access),
      Destination('Peru', 'Machu Picchu', 4.9, 98, Icons.terrain),
      Destination('Argentina', 'Buenos Aires', 4.7, 210, Icons.location_city),
    ],
    'Africa': [
      Destination('South Africa', 'Cape Town', 4.9, 441, Icons.landscape),
      Destination('Egypt', 'Cairo', 4.8, 803, Icons.account_balance),
      Destination('Morocco', 'Marrakesh', 4.7, 382, Icons.location_city),
    ],
    'Australia': [
      Destination('Australia', 'Sydney', 4.9, 744, Icons.sailing),
      Destination('New Zealand', 'Queenstown', 5, 529, Icons.terrain),
      Destination('Australia', 'Melbourne', 4.8, 612, Icons.location_city),
    ],
  };

  int selectedCategory = 3;
  @override
  Widget build(BuildContext context) {
    final name = widget.username.trim().isEmpty ? 'there' : widget.username.trim();
    final list = destinations[categories[selectedCategory]] ?? const [];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            _Header(name: name),
            const SizedBox(height: 18),
            const _SearchBar(),
            const SizedBox(height: 22),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select your next trip',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 36,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final selected = selectedCategory == index;
                  return GestureDetector(
                    onTap: () => setState(() {
                      selectedCategory = index;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected ? AppColors.dark : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black54,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: KeyedSubtree(
                  key: ValueKey(categories[selectedCategory]),
                  child: CardSwiper(
  cardsCount: list.length,
  numberOfCardsDisplayed: 3,
  isLoop: true,
  maxAngle: 8,
  scale: 0.94,
  backCardOffset: const Offset(14, 10),
  threshold: 80,
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
  cardBuilder: (
    context,
    index,
    percentThresholdX,
    percentThresholdY,
  ) {
    return DestinationCard(
      destination: list[index],
    );
  },
),
                ),
              ),
            ),
            const SizedBox(height: 8),
            BottomNavigation(
              onMessagesTap: () => openPage(context, const MessagesScreen()),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String name;
  const _Header({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    children: [
                      const TextSpan(text: 'Hello, '),
                      TextSpan(
                        text: name,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Welcome to TripGlide',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            radius: 19,
            backgroundColor: AppColors.teal,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.black54, size: 21),
                  SizedBox(width: 9),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.black45, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: AppColors.dark,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.tune, color: Colors.white, size: 19),
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openPage(
          context,
          DestinationDetailsScreen(
            destination: destination,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Full background image
              CachedNetworkImage(
                imageUrl: destination.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,

                placeholder: (context, url) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.backgroundGradient,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  );
                },

                errorWidget: (context, url, error) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.backgroundGradient,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.white,
                        size: 42,
                      ),
                    ),
                  );
                },
              ),

              // 2. Dark overlay for readability
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.05),
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.78),
                      ],
                      stops: const [
                        0.0,
                        0.42,
                        1.0,
                      ],
                    ),
                  ),
                ),
              ),

              // 3. Favourite button
              Positioned(
                top: 14,
                right: 14,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: AppColors.coral,
                    size: 21,
                  ),
                ),
              ),

              // 4. Country, city and rating
              Positioned(
                left: 18,
                right: 18,
                bottom: 72,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.country,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            destination.city,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              height: 1.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.yellow,
                              size: 17,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              destination.rating.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Text(
                      '${destination.reviews} reviews',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // 5. Bottom See More bar
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: const BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'See more',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.dark,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;
  const DestinationDetailsScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination.city)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CachedNetworkImage(
              imageUrl: destination.imageUrl,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 250,
                decoration: const BoxDecoration(
                  gradient: AppColors.backgroundGradient,
                ),
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: 250,
                decoration: const BoxDecoration(
                  gradient: AppColors.backgroundGradient,
                ),
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            destination.country,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
          Text(
            destination.city,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.yellow),
              const SizedBox(width: 5),
              Text('${destination.rating} rating · ${destination.reviews} reviews'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'About ${destination.city}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Discover local highlights, beautiful views, and memorable experiences in ${destination.city}. Build this destination into your next TripGlide adventure.',
            style: const TextStyle(color: Colors.black54, height: 1.55),
          ),
          const SizedBox(height: 24),
          appButton(
            context,
            'Plan this trip',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Trip saved to your plans')),
            ),
          ),
        ],
      ),
    );
  }
}
