import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/model/todo.dart';
import 'package:http/http.dart';

class TodoService {
  Future<List<Todo>> getAll() async {
    const url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await get(uri);
    if (response.statusCode == 200) {
      log("sucessss");
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
            id: e['id'],
            title: e['title'],
            userId: e['userId'],
            completed: e['completed']);
      }).toList();

      return todos;
    } else {
      log("unsuccess");
    }
    return [];
  }
}
