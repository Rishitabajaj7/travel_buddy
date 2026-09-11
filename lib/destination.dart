import 'package:flutter/material.dart';

class Destination {
  final String country;
  final String city;
  final double rating;
  final int reviews;
  final IconData icon;

  const Destination(
    this.country,
    this.city,
    this.rating,
    this.reviews,
    this.icon,
  );
}
