
import 'package:flutter/material.dart';

import 'package:todo_provider_app/models/todos.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo({required String name}) {
    var todo = Todo(id: todos.isNotEmpty ? todos.length + 1 : 1, title: name);
    todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(int id) {
    todos.removeWhere((elementId) => elementId.id == id);
    notifyListeners();
  }

  void todoChecked(int id) {
    

    todos[id - 1].done = !todos[id - 1].done;
    notifyListeners();
  }
}
