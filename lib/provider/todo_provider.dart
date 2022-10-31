import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/services/todo_services.dart';

class TodoProvider with ChangeNotifier {
  final _service = TodoService();
  bool _isLoading = true;
  final List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;

  Future<void> getAllTodos() async {
    log("working method");

    final response = await _service.getAll();
    _todos.addAll(response);
    _isLoading = false;
    notifyListeners();
  }
}
