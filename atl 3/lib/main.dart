  import 'package:flutter/material.dart';
  import 'post_list.dart';
  import 'todo.dart';

  import 'controller.dart';

  void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tâches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProduitsList(
        fetchTodos: fetchTodos,
        createTodo: createTodo,
        updateTodo: updateTodo,
        deleteTodo: deleteTodo,
      ),
    );
  }
}
