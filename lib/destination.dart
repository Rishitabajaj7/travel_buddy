import 'package:flutter/material.dart';

class DestinationTourDay {
  final int number;
  final String title;
  final String morning;
  final String afternoon;
  final String evening;

  const DestinationTourDay({
    required this.number,
    required this.title,
    required this.morning,
    required this.afternoon,
    required this.evening,
  });
}

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
        'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Jaipur':
        'https://images.unsplash.com/photo-1477587458883-47145ed94245?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Bangkok':
        'https://images.unsplash.com/photo-1508009603885-50cf7c579365?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Paris':
        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Rome':
        'https://images.unsplash.com/photo-1529260830199-42c24126f198?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Interlaken':
        'https://images.unsplash.com/photo-1530789253388-582c481c54b0?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'New York':
        'https://images.unsplash.com/photo-1485871981521-5b1fd3805eee?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Banff':
        'https://images.unsplash.com/photo-1503614472-8c93d56e92ce?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Cancún':
        'https://images.unsplash.com/photo-1552074284-5e88ef1aef18?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Rio de Janeiro':
        'https://images.unsplash.com/photo-1483729558449-99ef09a8c325?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Machu Picchu':
        'https://images.unsplash.com/photo-1526392060635-9d6019884377?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Buenos Aires':
        'https://images.unsplash.com/photo-1589909202802-8f4aadce1849?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Cape Town':
        'https://images.unsplash.com/photo-1580060839134-75a5edca2e99?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Cairo':
        'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Marrakesh':
        'https://images.unsplash.com/photo-1597212618440-806262de4f6b?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Sydney':
        'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d0?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Queenstown':
        'https://images.unsplash.com/photo-1507699622108-4be3abd695ad?auto=format&fit=crop&fm=jpg&w=1000&q=80',
    'Melbourne':
        'https://images.unsplash.com/photo-1514395462725-fb4566210144?auto=format&fit=crop&fm=jpg&w=1000&q=80',
  };

  static const Map<String, List<DestinationTourDay>> _tourPlans = {
    'Tokyo': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Tokyo',
        morning: 'Arrive in Tokyo and settle into your hotel',
        afternoon: 'Explore the nearby neighborhood and local shops',
        evening: 'Welcome dinner in a lively izakaya',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Asakusa and Shibuya',
        morning: 'Visit Senso-ji Temple and Nakamise Street',
        afternoon: 'Explore Shibuya Crossing and Harajuku',
        evening: 'Neon-lit night walk and ramen dinner',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Modern Tokyo',
        morning: 'Visit teamLab or a contemporary art museum',
        afternoon: 'Discover Tokyo Tower and shopping districts',
        evening: 'Dinner in a modern rooftop restaurant',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Food and Culture',
        morning: 'Enjoy a local market breakfast tour',
        afternoon: 'Sample street food and neighborhood specialties',
        evening: 'Traditional Japanese dinner experience',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Mount Fuji Day',
        morning: 'Travel to scenic areas with Fuji views',
        afternoon: 'Relax by the lakes and enjoy café stops',
        evening: 'Return to Tokyo for a calm evening',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and hotel checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Tokyo adventure',
      ),
    ],
    'Paris': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Paris',
        morning: 'Arrive in Paris and check in to your hotel',
        afternoon: 'Take a gentle walk through the local area',
        evening: 'Welcome dinner at a classic bistro',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Eiffel Tower Day',
        morning: 'Visit the Eiffel Tower and nearby attractions',
        afternoon: 'Walk along the Seine and café streets',
        evening: 'Sunset river cruise with dinner',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Louvre and Left Bank',
        morning: 'Explore the Louvre and museum district',
        afternoon: 'Discover Left Bank bookstores and cafés',
        evening: 'Dinner in a hidden neighborhood gem',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Montmartre Charm',
        morning: 'Visit Montmartre and Sacré-Cœur',
        afternoon: 'Enjoy art studios and local galleries',
        evening: 'Rooftop dinner with city views',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Versailles Escape',
        morning: 'Take a day trip to Versailles',
        afternoon: 'Explore the palace gardens and halls',
        evening: 'Return to Paris for a relaxed dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Paris itinerary',
      ),
    ],
    'Rio de Janeiro': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Rio de Janeiro',
        morning: 'Arrive in Rio and transfer to your hotel',
        afternoon: 'Relax by the beach or explore nearby streets',
        evening: 'Welcome dinner with Brazilian music and flavors',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Rio Highlights',
        morning: 'Visit the beaches and scenic promenade',
        afternoon: 'Take a guided city tour with viewpoints',
        evening: 'Sunset dinner in Ipanema',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Christ and Culture',
        morning: 'Ride up to Christ the Redeemer',
        afternoon: 'Explore Santa Teresa and local art streets',
        evening: 'Live samba and dinner in the city',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Beach Escape',
        morning: 'Relax on Copacabana or Arpoador beach',
        afternoon: 'Optional water sports or beachside lunch',
        evening: 'Fresh seafood dinner near the shore',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Local Life',
        morning: 'Explore local markets and neighborhoods',
        afternoon: 'Meet residents and discover street art',
        evening: 'Casual dinner at a neighborhood spot',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and hotel checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Rio adventure',
      ),
    ],
    'New York': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to New York',
        morning: 'Arrive and check in to your hotel',
        afternoon: 'Explore Midtown or Chelsea',
        evening: 'Welcome dinner with skyline views',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Manhattan Icons',
        morning: 'Visit Central Park and iconic landmarks',
        afternoon: 'Explore Fifth Avenue and SoHo',
        evening: 'Broadway show and late dinner',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Brooklyn Day',
        morning: 'Cross into Brooklyn',
        afternoon: 'Visit DUMBO, galleries, and cafés',
        evening: 'Dinner in a trendy neighborhood',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Harbor and Statue',
        morning: 'Explore Battery Park and harbor views',
        afternoon: 'Visit Lower Manhattan and waterfront spots',
        evening: 'Sunset views and seafood dinner',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Museum Day',
        morning: 'Visit the Met or MoMA',
        afternoon: 'Explore Upper East Side neighborhoods',
        evening: 'Relaxed dinner and evening stroll',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and hotel checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your New York trip',
      ),
    ],
    'Rome': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Rome',
        morning: 'Arrive in Rome and check in to your hotel',
        afternoon: 'Take a stroll around the historic center',
        evening: 'Pizza dinner and evening walks',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Ancient Rome',
        morning: 'Visit the Colosseum and Roman Forum',
        afternoon: 'Explore the surrounding historic streets',
        evening: 'Sunset aperitivo in the city',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Vatican and Art',
        morning: 'Visit Vatican City and St. Peter’s',
        afternoon: 'Explore nearby museums and galleries',
        evening: 'Romantic dinner in Trastevere',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Trevi and Piazzas',
        morning: 'See the Trevi Fountain and city squares',
        afternoon: 'Browse local boutiques and cafés',
        evening: 'Relaxed evening meal in the center',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Hilltop Views',
        morning: 'Visit the city’s scenic viewpoints',
        afternoon: 'Enjoy leisure time and local shopping',
        evening: 'Final dinner with Roman specialties',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and hotel checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Rome journey',
      ),
    ],
    'Bangkok': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Bangkok',
        morning: 'Arrive and settle into your hotel',
        afternoon: 'Explore the lively local streets',
        evening: 'Welcome dinner at a bustling night market',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Temple Day',
        morning: 'Visit iconic temples and historic sites',
        afternoon: 'Discover local markets and artisan shops',
        evening: 'River dinner cruise',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Canal and City',
        morning: 'Explore Bangkok’s canals and neighborhoods',
        afternoon: 'Visit a local floating market',
        evening: 'Street food experience',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Modern Bangkok',
        morning: 'Visit shopping districts and urban viewpoints',
        afternoon: 'Relax at a café in the city center',
        evening: 'Dinner in a rooftop restaurant',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Wellness and Leisure',
        morning: 'Enjoy a local spa or massage session',
        afternoon: 'Free time to browse and unwind',
        evening: 'Farewell dinner with Thai cuisine',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Bangkok trip',
      ),
    ],
    'Jaipur': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Jaipur',
        morning: 'Arrive and check in to your hotel',
        afternoon: 'Explore local markets and colors of the city',
        evening: 'Welcome dinner in the old city',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Palace Walk',
        morning: 'Visit Amber Fort and palace grounds',
        afternoon: 'Explore vibrant bazaars and artisan shops',
        evening: 'Dinner with traditional music',
      ),
      DestinationTourDay(
        number: 3,
        title: 'City Heritage',
        morning: 'See Hawa Mahal and historic architecture',
        afternoon: 'Visit museums and heritage streets',
        evening: 'Evening at leisure',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Culture Day',
        morning: 'Discover local crafts and workshops',
        afternoon: 'Enjoy lunch with local flavors',
        evening: 'Dress-up dinner or cultural event',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Scenic Escape',
        morning: 'Explore sunset viewpoints outside the city',
        afternoon: 'Relax and enjoy leisurely cafés',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Jaipur experience',
      ),
    ],
    'Interlaken': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Interlaken',
        morning: 'Arrive and settle in to your mountain stay',
        afternoon: 'Explore the lakefront and surrounding village',
        evening: 'Welcome dinner with alpine views',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Lakes and Peaks',
        morning: 'Take a scenic walking route around the lake',
        afternoon: 'Visit viewpoints and local trails',
        evening: 'Cozy alpine dinner',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Adventure Day',
        morning: 'Enjoy active outdoor experiences',
        afternoon: 'Take part in a guided adventure activity',
        evening: 'Dinner at a mountain lodge',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Swiss Experience',
        morning: 'Explore local shops and scenic villages',
        afternoon: 'Free time in the valley',
        evening: 'Relaxed evening meal',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Scenic Journey',
        morning: 'Ride a panoramic route through the mountains',
        afternoon: 'Enjoy a lakeside picnic and rest',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Interlaken escape',
      ),
    ],
    'Banff': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Banff',
        morning: 'Arrive and settle into your mountain lodge',
        afternoon: 'Explore the town center and view the peaks',
        evening: 'Welcome dinner with mountain scenery',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Lake and Valley',
        morning: 'Visit lakes and scenic viewpoints',
        afternoon: 'Enjoy a guided nature walk',
        evening: 'Dinner overlooking the mountains',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Outdoor Adventure',
        morning: 'Take a mountain trail or scenic hike',
        afternoon: 'Explore surrounding wilderness',
        evening: 'Cozy lodge evening',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Wildlife Day',
        morning: 'Visit national park lookouts',
        afternoon: 'Look for wildlife and nearby viewpoints',
        evening: 'Relaxed dinner in town',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Slow Scenic Day',
        morning: 'Enjoy a calm mountain and lake morning',
        afternoon: 'Free time for shopping and sightseeing',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Banff retreat',
      ),
    ],
    'Cancún': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Cancún',
        morning: 'Arrive and settle into your beachfront stay',
        afternoon: 'Relax on the beach and explore the area',
        evening: 'Welcome dinner by the shore',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Beach Day',
        morning: 'Enjoy the turquoise waters and white sand',
        afternoon: 'Explore local cenotes and coastal spots',
        evening: 'Sunset dinner on the beach',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Island Excursion',
        morning: 'Take a boat trip to nearby islands',
        afternoon: 'Snorkel or swim in clear waters',
        evening: 'Dinner with local seafood',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Culture and Coast',
        morning: 'Discover nearby towns and local culture',
        afternoon: 'Enjoy a leisurely lunch and shopping',
        evening: 'Beachside evening music',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Resort Leisure',
        morning: 'Relax at the resort and enjoy facilities',
        afternoon: 'Free time for wellness and spa',
        evening: 'Farewell dinner under the stars',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Cancún getaway',
      ),
    ],
    'Sydney': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Sydney',
        morning: 'Arrive and settle into your hotel',
        afternoon: 'Explore the harbor and nearby streets',
        evening: 'Welcome dinner with harbor views',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Harbor Highlights',
        morning: 'See the Opera House and bridge viewpoints',
        afternoon: 'Walk through the harbor promenade',
        evening: 'Harborfront dinner',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Beach and Brunch',
        morning: 'Visit Bondi or Manly beach',
        afternoon: 'Relax by the coast and browse cafés',
        evening: 'Beachside seafood meal',
      ),
      DestinationTourDay(
        number: 4,
        title: 'City and Culture',
        morning: 'Explore museums and local art spaces',
        afternoon: 'Take in neighborhood markets and shops',
        evening: 'Prepared dinner in the city',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Nature Day',
        morning: 'Visit scenic national park areas',
        afternoon: 'Enjoy views and outdoor leisure',
        evening: 'Final dinner and relaxed night',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Sydney trip',
      ),
    ],
    'Cape Town': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Cape Town',
        morning: 'Arrive and check in to your hotel',
        afternoon: 'Explore the coastline and local neighborhoods',
        evening: 'Welcome dinner with ocean views',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Table Mountain',
        morning: 'Visit Table Mountain and viewpoints',
        afternoon: 'Explore the city and nearby gardens',
        evening: 'Dinner with a sunset setting',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Cape Coast',
        morning: 'Drive along scenic coastal roads',
        afternoon: 'Visit beaches and sea lookout points',
        evening: 'Fresh seafood by the water',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Wineland Day',
        morning: 'Visit scenic vineyard regions',
        afternoon: 'Enjoy tastings and countryside views',
        evening: 'Two-course dinner experience',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Culture and Leisure',
        morning: 'Explore local markets and art scenes',
        afternoon: 'Free time to relax by the sea',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Cape Town story',
      ),
    ],
    'Cairo': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Cairo',
        morning: 'Arrive and settle into your hotel',
        afternoon: 'Explore the local city surroundings',
        evening: 'Welcome dinner with local flavors',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Historic Cairo',
        morning: 'Visit the pyramids and desert landscapes',
        afternoon: 'Explore nearby historic sites',
        evening: 'Dinner in a traditional setting',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Museum and Market',
        morning: 'Discover museums and cultural landmarks',
        afternoon: 'Browse local shopping districts',
        evening: 'Evening in the city center',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Nile Experience',
        morning: 'Enjoy a riverside walk near the Nile',
        afternoon: 'Take in local life and cafés',
        evening: 'Dinner by the water',
      ),
      DestinationTourDay(
        number: 5,
        title: 'City Leisure',
        morning: 'Slow morning and neighborhood walk',
        afternoon: 'Free time for last-minute shopping',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Cairo trip',
      ),
    ],
    'Melbourne': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Melbourne',
        morning: 'Arrive and check in to the city hotel',
        afternoon: 'Explore local neighborhoods and cafés',
        evening: 'Welcome dinner in the city',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Laneways and Culture',
        morning: 'Walk through hidden laneways and galleries',
        afternoon: 'Visit city markets and local shops',
        evening: 'Dinner in a cultural district',
      ),
      DestinationTourDay(
        number: 3,
        title: 'City Views',
        morning: 'Discover skyline viewpoints',
        afternoon: 'Enjoy a relaxed city afternoon',
        evening: 'Night out and dinner',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Food and Coffee',
        morning: 'Enjoy guided café and food tasting stops',
        afternoon: 'Explore local neighborhoods',
        evening: 'Chef-led dinner experience',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Leisure Day',
        morning: 'Slow morning and scenic walk',
        afternoon: 'Shop or relax in the city',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and hotel checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Melbourne itinerary',
      ),
    ],
    'Queenstown': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Queenstown',
        morning: 'Arrive and settle in to your alpine stay',
        afternoon: 'Explore the lakefront and town center',
        evening: 'Welcome dinner with lake views',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Scenic Lake Day',
        morning: 'Visit lakeside viewpoints',
        afternoon: 'Enjoy scenic walks and photo spots',
        evening: 'Dinner by the water',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Adventure Time',
        morning: 'Try an outdoor activity in the mountains',
        afternoon: 'Explore nearby adventure parks',
        evening: 'Relaxed evening meal',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Alpine Leisure',
        morning: 'Take a scenic drive through the valley',
        afternoon: 'Free time for shopping and cafés',
        evening: 'Mountain dining experience',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Slow Scenic Day',
        morning: 'Enjoy a peaceful mountain morning',
        afternoon: 'Take a short walk and rest by the lake',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Queenstown getaway',
      ),
    ],
    'Machu Picchu': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Machu Picchu',
        morning: 'Arrive and settle into your mountain lodge',
        afternoon: 'Explore the local village and scenic area',
        evening: 'Welcome dinner with Andean atmosphere',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Sacred Valley',
        morning: 'Visit the valley and surrounding ruins',
        afternoon: 'Explore scenic villages and heritage sites',
        evening: 'Dinner in a local lodge',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Mountain Views',
        morning: 'Take scenic routes around the mountains',
        afternoon: 'Enjoy a relaxed day with viewpoints',
        evening: 'Evening meal and quiet rest',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Cultural Exploration',
        morning: 'Visit local heritage spots and markets',
        afternoon: 'Discover craft shops and traditions',
        evening: 'Dinner with local flavors',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Nature Escape',
        morning: 'Enjoy surrounding nature and trails',
        afternoon: 'Free time for photography and leisure',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Machu Picchu adventure',
      ),
    ],
    'Buenos Aires': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Buenos Aires',
        morning: 'Arrive and check in to your hotel',
        afternoon: 'Explore neighborhood streets and cafés',
        evening: 'Welcome dinner with local flavors',
      ),
      DestinationTourDay(
        number: 2,
        title: 'City Highlights',
        morning: 'Explore cultural landmarks and plazas',
        afternoon: 'Visit local markets and boutiques',
        evening: 'Tango and dinner night',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Art and History',
        morning: 'Visit museums and historic points',
        afternoon: 'Explore the local cultural scene',
        evening: 'Relaxed evening meal',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Café and River',
        morning: 'Walk along riverside paths and cafés',
        afternoon: 'Free time for leisure and shopping',
        evening: 'Dinner in a local neighborhood',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Local Culture',
        morning: 'Discover local music and craft spots',
        afternoon: 'Extra sightseeing and free time',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Buenos Aires trip',
      ),
    ],
    'Marrakesh': [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to Marrakesh',
        morning: 'Arrive and settle into your riad',
        afternoon: 'Explore the vibrant medina',
        evening: 'Welcome dinner with Moroccan flavors',
      ),
      DestinationTourDay(
        number: 2,
        title: 'Medina Walk',
        morning: 'Explore souks and historical streets',
        afternoon: 'Visit plazas and café culture',
        evening: 'Traditional dinner and music',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Garden Day',
        morning: 'Visit botanical and palace gardens',
        afternoon: 'Relax and enjoy the local surroundings',
        evening: 'Rooftop dinner with sunset views',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Atlas Escape',
        morning: 'Day trip into the Atlas landscapes',
        afternoon: 'Enjoy scenic stops and local villages',
        evening: 'Evening in the city',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Culture and Craft',
        morning: 'Discover artisan workshops',
        afternoon: 'Shop for souvenirs and textiles',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your Marrakesh stay',
      ),
    ],
  };

  List<DestinationTourDay> get tourPlan {
    return _tourPlans[city] ?? [
      DestinationTourDay(
        number: 1,
        title: 'Arrival to $city',
        morning: 'Arrive in $city and transfer to your hotel',
        afternoon: 'Free time to relax and explore the nearby area',
        evening: 'Welcome dinner at a local restaurant',
      ),
      DestinationTourDay(
        number: 2,
        title: '$city Highlights',
        morning: 'Enjoy a guided city tour',
        afternoon: 'Visit major attractions and scenic spots',
        evening: 'Dinner with local cuisine',
      ),
      DestinationTourDay(
        number: 3,
        title: 'Culture and History',
        morning: 'Explore heritage landmarks and neighborhoods',
        afternoon: 'Learn about local history and customs',
        evening: 'Relaxed evening at leisure',
      ),
      DestinationTourDay(
        number: 4,
        title: 'Nature and Adventure',
        morning: 'Enjoy a scenic excursion or outdoor activity',
        afternoon: 'Spend time in nature or on a local excursion',
        evening: 'Return to your hotel for rest',
      ),
      DestinationTourDay(
        number: 5,
        title: 'Local Experiences',
        morning: 'Discover hidden gems with a local guide',
        afternoon: 'Free time for shopping or café stops',
        evening: 'Farewell dinner',
      ),
      DestinationTourDay(
        number: 6,
        title: 'Departure',
        morning: 'Breakfast and hotel checkout',
        afternoon: 'Transfer to the airport',
        evening: 'End of your adventure',
      ),
    ];
  }

  String get imageUrl => _imageUrls[city] ?? '';
}