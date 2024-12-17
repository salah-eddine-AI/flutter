// ignore_for_file: avoid_print

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'base.g.dart';

@DataClassName("Produit")
class Produits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get libelle => text().withLength(min: 2, max: 120)();
  TextColumn get description => text()();
  TextColumn get photo => text()();
}

@DriftDatabase(tables: [Produits])
class ProduitsDatabase extends _$ProduitsDatabase {
  ProduitsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'produits.db'));
    return NativeDatabase.createInBackground(file);
  });
}

// Example Usage
Future<void> main() async {
  final db = ProduitsDatabase();

  // Insert a new Produit
  Future<void> insertProduit(String libelle, String description, String photo) async {
    final produit = ProduitsCompanion(
      libelle: Value(libelle),
      description: Value(description),
      photo: Value(photo),
    );
    await db.into(db.produits).insert(produit);
  }

  // Fetch all Produits
  Future<List<Produit>> fetchProduits() async {
    return await db.select(db.produits).get();
  }

  // Example Workflow
  await insertProduit("Produit 1", "Description of Produit 1", "photo_url_1");
  await insertProduit("Produit 2", "Description of Produit 2", "photo_url_2");

  final produits = await fetchProduits();
  for (var produit in produits) {
    print('ID: ${produit.id}, Libelle: ${produit.libelle}, Description: ${produit.description}, Photo: ${produit.photo}');
  }
}