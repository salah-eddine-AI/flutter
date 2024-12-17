import 'dart:convert';
import 'package:flutter/material.dart';
import 'todo.dart';
import 'TaskDetailsScreen.dart'; 


class ProduitsList extends StatefulWidget {
  final Future<List<Todo>> Function() fetchTodos;
  final Future<Todo> Function(Todo) createTodo;
  final Future<void> Function(Todo) updateTodo;
  final Future<void> Function(int) deleteTodo;

  const ProduitsList({
    Key? key,
    required this.fetchTodos,
    required this.createTodo,
    required this.updateTodo,
    required this.deleteTodo,
  }) : super(key: key);

  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  late List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  void _fetchTodos() async {
    try {
      final todos = await widget.fetchTodos();
      setState(() {
        _todos = todos;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de chargement: $e')),
      );
    }
  }

  void _showAddTodoDialog() {
    final TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ajouter une nouvelle tâche'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Titre'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                final newTodo = Todo(
                  id: 0,
                  userId: 1, // Placeholder userId
                  title: titleController.text,
                  completed: false,
                );
                try {
                  final todo = await widget.createTodo(newTodo);
                  setState(() {
                    _todos.add(todo);
                  });
                  Navigator.of(context).pop();
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erreur: $error')),
                  );
                }
              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tâches')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: todo.completed ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Checkbox(
                value: todo.completed,
                onChanged: (value) async {
                  final updatedTodo = Todo(
                    id: todo.id,
                    userId: todo.userId,
                    title: todo.title,
                    completed: value ?? todo.completed,
                  );
                  try {
                    await widget.updateTodo(updatedTodo);
                    setState(() {
                      _todos[index] = updatedTodo;
                    });
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erreur: $error')),
                    );
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailsScreen(todo: todo),
                  ),
                );
              },
              onLongPress: () async {
                try {
                  await widget.deleteTodo(todo.id);
                  setState(() {
                    _todos.removeAt(index);
                  });
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erreur: $error')),
                  );
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
