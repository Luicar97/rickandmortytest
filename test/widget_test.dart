// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trumed/core/di/injector.dart';
import 'package:trumed/features/character/home/presentation/views/character_view.dart';

void main() {
  setUp(() {
    configureDependencies();
  });

  final search = find.byKey(const ValueKey('search'));

  testWidgets('Buscador', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CharacterView(),
      ),
    ));

    expect(find.text(''), findsOneWidget);

    await tester.enterText(search, 'Rick Sanchez');
    await tester.pump();

    expect(find.text('Rick Sanchez'), findsOneWidget);

    await tester.tap(search);
    await tester.pump();

    await tester.enterText(search, '');
    await tester.pump();

    expect(find.text(''), findsOneWidget);
  });
}
