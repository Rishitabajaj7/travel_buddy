import 'dart:convert';

import 'package:http/http.dart' as http;

class TravelBuddyResponse {
  final List<TravelBuddy> users;
  final int total;
  final int skip;
  final int limit;
  final bool isSampleData;

  const TravelBuddyResponse({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
    this.isSampleData = false,
  });

  factory TravelBuddyResponse.fromJson(Map<String, dynamic> json) {
    return TravelBuddyResponse(
      users: (json['users'] as List<dynamic>)
          .map((user) => TravelBuddy.fromJson(user as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      skip: json['skip'] as int,
      limit: json['limit'] as int,
    );
  }
}

class TravelBuddy {
  final int id;
  final String firstName;
  final String lastName;
  final String image;
  final String university;
  final String email;
  final TravelBuddyLocation location;

  const TravelBuddy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.university,
    required this.email,
    required this.location,
  });

  String get fullName => '$firstName $lastName';

  factory TravelBuddy.fromJson(Map<String, dynamic> json) {
    return TravelBuddy(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      image: json['image'] as String,
      university: json['university'] as String,
      email: json['email'] as String,
      location: TravelBuddyLocation.fromJson(
        json['address'] as Map<String, dynamic>,
      ),
    );
  }
}

class TravelBuddyLocation {
  final String city;
  final String country;

  const TravelBuddyLocation({required this.city, required this.country});

  factory TravelBuddyLocation.fromJson(Map<String, dynamic> json) {
    return TravelBuddyLocation(
      city: json['city'] as String,
      country: json['country'] as String,
    );
  }
}

class TravelBuddyApi {
  TravelBuddyApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static final _usersUri = Uri.https('dummyjson.com', '/users', {
    'limit': '12',
    'select': 'firstName,lastName,image,university,email,address',
  });

  Future<TravelBuddyResponse> getTravelBuddies() async {
    try {
      final response = await _client
          .get(_usersUri)
          .timeout(const Duration(seconds: 10));
      if (response.statusCode != 200) {
        return _sampleResponse;
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return TravelBuddyResponse.fromJson(json);
    } on Object {
      return _sampleResponse;
    }
  }

  void close() => _client.close();

  static const _sampleResponse = TravelBuddyResponse(
    users: [
      TravelBuddy(
        id: 1,
        firstName: 'Maya',
        lastName: 'Chen',
        image: '',
        university: 'Tokyo travel guide',
        email: 'maya@example.com',
        location: TravelBuddyLocation(city: 'Tokyo', country: 'Japan'),
      ),
      TravelBuddy(
        id: 2,
        firstName: 'Leo',
        lastName: 'Martin',
        image: '',
        university: 'Paris culture enthusiast',
        email: 'leo@example.com',
        location: TravelBuddyLocation(city: 'Paris', country: 'France'),
      ),
      TravelBuddy(
        id: 3,
        firstName: 'Sofia',
        lastName: 'Costa',
        image: '',
        university: 'Rio hiking guide',
        email: 'sofia@example.com',
        location: TravelBuddyLocation(city: 'Rio de Janeiro', country: 'Brazil'),
      ),
    ],
    total: 3,
    skip: 0,
    limit: 3,
    isSampleData: true,
  );
}
