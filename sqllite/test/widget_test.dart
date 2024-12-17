import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sqllite/main.dart';
import 'package:sqllite/base.dart';
import 'package:sqllite/dao/produit_dao.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Initialize the database and DAO
    final database = ProduitsDatabase();
    final produitDAO = ProduitDAO(database);

    // Build our app and trigger a frame, providing the required produitDAO
    await tester.pumpWidget(MyApp(produitDAO: produitDAO));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
