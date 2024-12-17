import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Import du package

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final Function(bool?)? onChanged;
  final Function()? delProduit; // Déclarez la fonction de suppression

  const ProduitBox({
    super.key,
    required this.nomProduit,
    this.selProduit = false,
    this.onChanged,
    this.delProduit, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // Ajout de padding
      child: Slidable(
        // Définition du panneau d'actions à droite
        endActionPane: ActionPane(
          motion: const StretchMotion(), // Type de mouvement
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                if (delProduit != null) {
                  delProduit!(); // Appel de la fonction de suppression
                }
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: 'Supprimer', // Label pour l'action
              borderRadius: BorderRadius.circular(45), // Bordure arrondie
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow, // Couleur de fond
            borderRadius: BorderRadius.circular(45), // Bordure arrondie
          ),
          height: 100.0,
          child: Row(
            children: [
              Checkbox(
                value: selProduit,
                onChanged: onChanged,
              ),
              Text(nomProduit),
            ],
          ),
        ),
      ),
    );
  }
}
