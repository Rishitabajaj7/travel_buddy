import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'travel_buddy_api.dart';

class TravelBuddiesScreen extends StatefulWidget {
  const TravelBuddiesScreen({super.key});

  @override
  State<TravelBuddiesScreen> createState() => _TravelBuddiesScreenState();
}

class _TravelBuddiesScreenState extends State<TravelBuddiesScreen> {
  final TravelBuddyApi _api = TravelBuddyApi();
  late Future<TravelBuddyResponse> _travelBuddies;
  final Set<int> _favorites = {};

  @override
  void initState() {
    super.initState();
    _loadTravelBuddies();
  }

  void _loadTravelBuddies() {
    _travelBuddies = _api.getTravelBuddies();
  }

  @override
  void dispose() {
    _api.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel buddies'),
        actions: [
          IconButton(
            tooltip: 'Refresh travelers',
            onPressed: () => setState(_loadTravelBuddies),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<TravelBuddyResponse>(
        future: _travelBuddies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return _ErrorView(onRetry: () => setState(_loadTravelBuddies));
          }

          final response = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              const Text('Meet your next travel companion',
                  style: AppColors.heading),
              const SizedBox(height: 5),
              const Text(
                'Travelers and local connections from around the world.',
                style: AppColors.muted,
              ),
              const SizedBox(height: 16),
              if (response.isSampleData) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.yellow.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Offline preview: showing sample travel profiles.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              Text(
                '${response.users.length} of ${response.total} profiles',
                style: AppColors.muted,
              ),
              const SizedBox(height: 8),
              ...response.users.map(
                (buddy) => _BuddyTile(
                  buddy: buddy,
                  isFavorite: _favorites.contains(buddy.id),
                  onFavoriteTap: () => setState(() {
                    if (!_favorites.add(buddy.id)) {
                      _favorites.remove(buddy.id);
                    }
                  }),
                  onTap: () => _showProfile(buddy),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showProfile(TravelBuddy buddy) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(buddy.fullName, style: AppColors.sectionHeading),
              const SizedBox(height: 10),
              Text('${buddy.location.city}, ${buddy.location.country}'),
              const SizedBox(height: 6),
              Text('Studied at ${buddy.university}'),
              const SizedBox(height: 6),
              Text(buddy.email, style: AppColors.muted),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuddyTile extends StatelessWidget {
  final TravelBuddy buddy;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  const _BuddyTile({
    required this.buddy,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.teal,
          foregroundImage: buddy.image.isEmpty
              ? null
              : CachedNetworkImageProvider(buddy.image),
          child: Text(
            '${buddy.firstName[0]}${buddy.lastName[0]}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        title: Text(
          buddy.fullName,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 3),
            Text('${buddy.location.city}, ${buddy.location.country}'),
            Text(
              buddy.university,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppColors.muted,
            ),
          ],
        ),
        trailing: IconButton(
          tooltip: isFavorite ? 'Remove favorite' : 'Add favorite',
          onPressed: onFavoriteTap,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? AppColors.coral : AppColors.dark,
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_outlined, size: 36),
            const SizedBox(height: 10),
            const Text('Travel buddies could not be loaded.'),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
