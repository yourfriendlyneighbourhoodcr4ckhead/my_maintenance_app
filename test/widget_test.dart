import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_maintenance_app/main.dart';

void main() {
  testWidgets('App loads DashboardScreen', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Check if the Dashboard title is present.
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
