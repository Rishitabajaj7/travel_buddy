import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'message.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const categories = [
    'Asia',
    'Europe',
    'North America',
    'South America',
    'Africa',
    'Australia',
  ];
  static const destinations = <String, List<Destination>>{
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
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    final name = widget.username.trim().isEmpty ? 'there' : widget.username.trim();
    final list = destinations[categories[selectedCategory]]!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            _Header(name),
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
              height: 34,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() {
                    selectedCategory = index;
                    selectedCard = 0;
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedCategory == index ? AppColors.dark : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: selectedCategory == index ? Colors.white : Colors.black54,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: PageView.builder(
                controller: PageController(viewportFraction: .86, initialPage: selectedCard),
                itemCount: list.length,
                onPageChanged: (index) => setState(() => selectedCard = index),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8, bottom: 8),
                  child: DestinationCard(destination: list[index]),
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

class Destination {
  final String country;
  final String city;
  final double rating;
  final int reviews;
  final IconData icon;
  const Destination(this.country, this.city, this.rating, this.reviews, this.icon);
}

class _Header extends StatelessWidget {
  final String name;
  const _Header(this.name);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                      children: [
                        const TextSpan(text: 'Hey, '),
                        TextSpan(text: '$name!', style: const TextStyle(color: AppColors.coral)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text('Welcome to Travel Buddy', style: TextStyle(color: Colors.black54, fontSize: 11)),
                ],
              ),
            ),
            const CircleAvatar(radius: 19, backgroundColor: AppColors.teal, child: Icon(Icons.person, color: Colors.white)),
          ],
        ),
      );
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                child: const Row(children: [Icon(Icons.search, color: Colors.black54, size: 21), SizedBox(width: 9), Text('Search', style: TextStyle(color: Colors.black45, fontSize: 12))]),
              ),
            ),
            const SizedBox(width: 10),
            Container(width: 44, height: 44, decoration: const BoxDecoration(color: AppColors.dark, shape: BoxShape.circle), child: const Icon(Icons.tune, color: Colors.white, size: 19)),
          ],
        ),
      );
}

class DestinationCard extends StatelessWidget {
  final Destination destination;
  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => openPage(context, DestinationDetailsScreen(destination: destination)),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .12), blurRadius: 16, offset: const Offset(0, 8))]),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(width: double.infinity, decoration: const BoxDecoration(gradient: AppColors.backgroundGradient, borderRadius: BorderRadius.vertical(top: Radius.circular(24))), child: Center(child: Icon(destination.icon, color: Colors.white24, size: 90))),
                    Positioned(top: 13, right: 13, child: Container(width: 36, height: 36, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: const Icon(Icons.favorite_border, size: 18, color: AppColors.coral))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 13, 18, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [const Icon(Icons.circle, color: AppColors.teal, size: 9), const SizedBox(width: 6), Text(destination.country, style: const TextStyle(color: Colors.black54, fontSize: 12))]),
                    const SizedBox(height: 5),
                    Row(children: [Expanded(child: Text(destination.city, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold))), const Icon(Icons.star, color: AppColors.yellow, size: 17), const SizedBox(width: 3), Text('${destination.rating}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12))]),
                    const SizedBox(height: 2),
                    Text('${destination.reviews} reviews', style: const TextStyle(color: Colors.black38, fontSize: 11)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12), decoration: const BoxDecoration(color: AppColors.dark, borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))), child: Row(children: [const Text('See more', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)), const Spacer(), Container(width: 32, height: 32, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: const Icon(Icons.arrow_forward, size: 16, color: AppColors.dark))])),
            ],
          ),
        ),
      );
}

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;
  const DestinationDetailsScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(destination.city)),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            Container(height: 250, decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), gradient: AppColors.backgroundGradient), child: Center(child: Icon(destination.icon, size: 100, color: Colors.white70))),
            const SizedBox(height: 22),
            Text(destination.country, style: const TextStyle(color: Colors.black54, fontSize: 14)),
            Text(destination.city, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(children: [const Icon(Icons.star, color: AppColors.yellow), const SizedBox(width: 5), Text('${destination.rating} rating · ${destination.reviews} reviews')]),
            const SizedBox(height: 20),
            Text('About ${destination.city}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Discover local highlights, beautiful views, and memorable experiences in ${destination.city}. Build this destination into your next TripGlide adventure.', style: const TextStyle(color: Colors.black54, height: 1.55)),
            const SizedBox(height: 24),
            appButton(context, 'Plan this trip', onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Trip saved to your plans')))),
          ],
        ),
      );
}

class BottomNavigation extends StatelessWidget {
  final VoidCallback? onMessagesTap;
  const BottomNavigation({super.key, this.onMessagesTap});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 58,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(color: AppColors.dark, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _NavIcon(Icons.home_rounded, selected: true),
              IconButton(onPressed: onMessagesTap, icon: const Icon(Icons.chat_bubble_outline, color: Colors.white)),
              const _NavIcon(Icons.favorite_border),
              const _NavIcon(Icons.grid_view_rounded),
            ],
          ),
        ),
      );
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  const _NavIcon(this.icon, {this.selected = false});

  @override
  Widget build(BuildContext context) => Container(width: 38, height: 38, decoration: BoxDecoration(color: selected ? Colors.white : Colors.transparent, shape: BoxShape.circle), child: Icon(icon, color: selected ? AppColors.dark : Colors.white70, size: 20));
}
