import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:a1/main.dart';

void main() {
  testWidgets('VangtiChai app test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const VangtiChaiApp());

    // Verify that the app starts with 'Taka:' label
    expect(find.text('Taka:'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Verify clear button exists
    expect(find.byIcon(Icons.clear), findsOneWidget);
  });
}