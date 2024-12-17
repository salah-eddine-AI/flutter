import 'dart:convert';
import 'package:http/http.dart' as http;
import 'todo.dart'; 

Future<List<Todo>> fetchTodos() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    List<dynamic> jsonTodos = json.decode(response.body);
    return jsonTodos.map((json) => Todo.fromJson(json)).toList();
  } else {
    throw Exception('Erreur de chargement des tâches');
  }
}

Future<Todo> createTodo(Todo todo) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(todo.toJson()),
  );

  if (response.statusCode == 201) {
    return Todo.fromJson(json.decode(response.body));
  } else {
    throw Exception('Erreur de création de tâche');
  }
}

Future<void> updateTodo(Todo todo) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/${todo.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(todo.toJson()),
  );

  if (response.statusCode != 200) {
    throw Exception('Erreur de mise à jour de tâche');
  }
}

Future<void> deleteTodo(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('Erreur de suppression de tâche');
  }
}
