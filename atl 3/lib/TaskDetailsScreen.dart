import 'package:flutter/material.dart';
import 'todo.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Todo todo;

  const TaskDetailsScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails de la tâche')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Titre:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(todo.title, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'ID utilisateur:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(todo.userId.toString(), style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'Tâche terminée:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(todo.completed ? 'Oui' : 'Non', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
