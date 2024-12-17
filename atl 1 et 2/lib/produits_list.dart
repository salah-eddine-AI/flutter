import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart'; // Import the AddProduit class

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key}); // Added const here for consistency

  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  final List<List<dynamic>> liste = [
    ["1 produit", false],
    ["2 produit", false],
    ["3 produit", false],
    ["4 produit", false],
    ["5 produit", false],
  ];

  final TextEditingController nomController = TextEditingController(); // Declare the TextEditingController

  void onChanged(bool? value, int index) {
    setState(() {
      liste[index][1] = value; // Update the selection state
    });
  }

  void delProduit(int index) {
    setState(() {
      liste.removeAt(index); // Corrected to removeAt instead of remove
    });
  }

  void deleteSelectedProducts() {
    setState(() {
      // Filter the list to remove selected products
      liste.removeWhere((product) => product[1] == true);
    });
  }

  void saveProduit() {
    setState(() {
      liste.add([nomController.text, false]); // Add a new product to the list
      nomController.clear(); // Clear the text field
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  void addProduit() {
    showDialog(
      context: context,
      builder: (context) {
        return AddProduit(
          nomController: nomController,
          onAdd: saveProduit,
          onCancel: () {
            Navigator.pop(context); // Close the dialog
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produits"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete), // Icon for delete selected products
            onPressed: deleteSelectedProducts, // Call the delete function
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduit, // Call addProduit to show the dialog
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: liste[index][0], // Access to nomProduit
            selProduit: liste[index][1],  // Access to selProduit
            onChanged: (value) => onChanged(value, index),
            delProduit: () => delProduit(index), // Pass the delete function
          );
        },
      ),
    );
  }
}
