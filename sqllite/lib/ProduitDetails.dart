import 'dart:io';
import 'package:flutter/material.dart';
import 'base.dart';

class ProduitDetails extends StatelessWidget {
  final Produit produit;

  const ProduitDetails({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          produit.libelle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                produit.photo.isNotEmpty && File(produit.photo).existsSync()
                    ? Image.file(
                        File(produit.photo),
                        height: 160,
                        width: 160,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.image_not_supported,
                        size: 160,
                        color: Colors.grey,
                      ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Description: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: produit.description,
                      ),
                    ],
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}