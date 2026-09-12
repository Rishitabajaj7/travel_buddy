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

  static const Map<String, String> _imageUrls = {
    'Tokyo':
        'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?auto=format&fit=crop&w=1000&q=85',
    'Jaipur':
        'https://images.unsplash.com/photo-1477587458883-47145ed94245?auto=format&fit=crop&w=1000&q=85',
    'Bangkok':
        'https://images.unsplash.com/photo-1508009603885-50cf7c579365?auto=format&fit=crop&w=1000&q=85',
    'Paris':
        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=1000&q=85',
    'Rome':
        'https://images.unsplash.com/photo-1529260830199-42c24126f198?auto=format&fit=crop&w=1000&q=85',
    'Interlaken':
        'https://images.unsplash.com/photo-1530789253388-582c481c54b0?auto=format&fit=crop&w=1000&q=85',
    'New York':
        'https://images.unsplash.com/photo-1485871981521-5b1fd3805eee?auto=format&fit=crop&w=1000&q=85',
    'Banff':
        'https://images.unsplash.com/photo-1503614472-8c93d56e92ce?auto=format&fit=crop&w=1000&q=85',
    'Cancún':
        'https://images.unsplash.com/photo-1552074284-5e88ef1aef18?auto=format&fit=crop&w=1000&q=85',
    'Rio de Janeiro':
        'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?auto=format&fit=crop&w=1000&q=85',
    'Machu Picchu':
        'https://images.unsplash.com/photo-1526392060635-9d6019884377?auto=format&fit=crop&w=1000&q=85',
    'Buenos Aires':
        'https://images.unsplash.com/photo-1589909202802-8f4aadce1849?auto=format&fit=crop&w=1000&q=85',
    'Cape Town':
        'https://images.unsplash.com/photo-1580060839134-75a5edca2e99?auto=format&fit=crop&w=1000&q=85',
    'Cairo':
        'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?auto=format&fit=crop&w=1000&q=85',
    'Marrakesh':
        'https://images.unsplash.com/photo-1597212618440-806262de4f6b?auto=format&fit=crop&w=1000&q=85',
    'Sydney':
        'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d0?auto=format&fit=crop&w=1000&q=85',
    'Queenstown':
        'https://images.unsplash.com/photo-1507699622108-4be3abd695ad?auto=format&fit=crop&w=1000&q=85',
    'Melbourne':
        'https://images.unsplash.com/photo-1514395462725-fb4566210144?auto=format&fit=crop&w=1000&q=85',
  };

  String get imageUrl => _imageUrls[city] ?? '';
}