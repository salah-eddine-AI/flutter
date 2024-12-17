import 'package:flutter/material.dart';
import 'base.dart';
import 'dao/produit_dao.dart';
import 'ProduitBox.dart';
import 'addProduitForm.dart';

void main() {
  // Initialize the database
  final database = ProduitsDatabase();

  // Initialize the DAO with the database
  final produitDAO = ProduitDAO(database);

  // Pass the DAO to the application
  runApp(MyApp(produitDAO: produitDAO));
}

class MyApp extends StatelessWidget {
  final ProduitDAO produitDAO;

  const MyApp({Key? key, required this.produitDAO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProduitsList(produitDAO: produitDAO),
    );
  }
}

class ProduitsList extends StatelessWidget {
  final ProduitDAO produitDAO;

  const ProduitsList({Key? key, required this.produitDAO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List des produits"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProduitForm(
                produitDAO: produitDAO,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<Object>(
        stream: produitDAO.getProduitsStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {  // Fixed: it should be `snapshot.hasData`
            return const Center(
              child: Text("Aucun produit n'est disponible"),
            );
          }
          final liste = snapshot.data as List<Produit>?;  // Null safety added here
          return ListView.builder(
            itemCount: liste!.length,
            itemBuilder: (context, index) {
              final produit = liste[index];
              return ProduitBox(
                produit: produit,
                produitDAO: produitDAO,
              );
            },
          );
        },
      ),
    );
  }
}
