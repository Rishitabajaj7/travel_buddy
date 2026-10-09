import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:travel_buddy/travel_buddy_api.dart';

void main() {
  test('parses traveler profiles and nested addresses', () {
    final response = TravelBuddyResponse.fromJson({
      'users': [
        {
          'id': 1,
          'firstName': 'Emily',
          'lastName': 'Johnson',
          'image': 'https://example.com/emily.jpg',
          'university': 'Example University',
          'email': 'emily@example.com',
          'address': {
            'city': 'Kyoto',
            'country': 'Japan',
          },
        },
      ],
      'total': 208,
      'skip': 0,
      'limit': 12,
    });

    final buddy = response.users.single;
    expect(response.total, 208);
    expect(response.limit, 12);
    expect(buddy.fullName, 'Emily Johnson');
    expect(buddy.location.city, 'Kyoto');
    expect(buddy.location.country, 'Japan');
  });

  test('returns sample travel profiles when the API is unavailable', () async {
    final api = TravelBuddyApi(
      client: MockClient((_) async => throw Exception('offline')),
    );

    final response = await api.getTravelBuddies();
    api.close();

    expect(response.isSampleData, isTrue);
    expect(response.users, hasLength(3));
    expect(response.users.first.location.city, 'Tokyo');
  });
}
