import 'package:flutter/material.dart';

import 'app_theme.dart';

class BottomNavigation extends StatelessWidget {
  final VoidCallback? onMessagesTap;
  const BottomNavigation({super.key, this.onMessagesTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _NavIcon(icon: Icons.home_rounded, selected: true),
            IconButton(
              onPressed: onMessagesTap,
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
            ),
            const _NavIcon(icon: Icons.favorite_border),
            const _NavIcon(icon: Icons.grid_view_rounded),
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  const _NavIcon({required this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: selected ? AppColors.dark : Colors.white70,
        size: 20,
      ),
    );
  }
}
