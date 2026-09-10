import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:travel_buddy/main.dart';

void main() {
  testWidgets('welcomes the user and opens the personalized dashboard',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TravelBuddyApp());

    expect(find.text('Go somewhere\nworth remembering.'), findsOneWidget);

    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'Vanessa');
    await tester.enterText(find.byType(TextFormField).at(1), 'vanessa@example.com');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Hey, Vanessa!', findRichText: true), findsOneWidget);
    expect(find.text('Rio de Janeiro'), findsOneWidget);
    expect(find.text('South America'), findsOneWidget);
  });
}
