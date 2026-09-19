import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'destination.dart';

class TourDetailsScreen extends StatefulWidget {
  final Destination destination;

  const TourDetailsScreen({
    super.key,
    required this.destination,
  });

  @override
  State<TourDetailsScreen> createState() => _TourDetailsScreenState();
}

class _TourDetailsScreenState extends State<TourDetailsScreen> {
  final Set<int> _expandedDays = {1};

  List<_ItineraryDay> get _days {
    return widget.destination.tourPlan.map((day) {
      return _ItineraryDay(
        number: day.number,
        title: day.title,
        morning: day.morning,
        afternoon: day.afternoon,
        evening: day.evening,
      );
    }).toList();
  }

  void _toggleDay(int day) {
    setState(() {
      if (_expandedDays.contains(day)) {
        _expandedDays.remove(day);
      } else {
        _expandedDays.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                    child: _Header(destination: destination),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                const SliverToBoxAdapter(child: _Tabs()),
                const SliverToBoxAdapter(child: SizedBox(height: 18)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '8-Days ${destination.city} Adventure',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 14)),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 92),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final day = _days[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _DayCard(
                            day: day,
                            imageUrl: destination.imageUrl,
                            expanded: _expandedDays.contains(day.number),
                            onTap: () => _toggleDay(day.number),
                          ),
                        );
                      },
                      childCount: _days.length,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 14,
              child: SafeArea(
                top: false,
                child: SizedBox(
                  height: 52,
                  child: FilledButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Booking feature coming soon!'),
                        ),
                      );
                    },
                    child: const Text(
                      'Book my tour',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Destination destination;

  const _Header({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Row(
        children: [
          _CircleButton(
            icon: Icons.arrow_back_ios_new,
            onTap: () => Navigator.pop(context),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Iconic ${destination.city}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Wed, Oct 21 – Sun, Nov 1',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const _CircleButton(icon: Icons.favorite_border),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CircleButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 17),
        ),
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: const [
          _Tab(label: 'Tour schedule', selected: true),
          _Tab(label: 'Accommodation'),
          _Tab(label: 'Booking details'),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool selected;

  const _Tab({
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? AppColors.dark : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black45,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ItineraryDay {
  final int number;
  final String title;
  final String morning;
  final String afternoon;
  final String evening;

  const _ItineraryDay({
    required this.number,
    required this.title,
    required this.morning,
    required this.afternoon,
    required this.evening,
  });
}

class _DayCard extends StatelessWidget {
  final _ItineraryDay day;
  final String imageUrl;
  final bool expanded;
  final VoidCallback onTap;

  const _DayCard({
    required this.day,
    required this.imageUrl,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 66,
                    height: 50,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(
                      width: 66,
                      height: 50,
                      color: AppColors.teal,
                      child: const Icon(
                        Icons.image_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Day ${day.number}',
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        day.title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 21,
                ),
              ],
            ),
          ),
          if (expanded) ...[
            const SizedBox(height: 14),
            _Activity(label: 'Morning', text: day.morning),
            _Activity(label: 'Afternoon', text: day.afternoon),
            _Activity(label: 'Evening', text: day.evening),
          ],
        ],
      ),
    );
  }
}

class _Activity extends StatelessWidget {
  final String label;
  final String text;

  const _Activity({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 9,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}