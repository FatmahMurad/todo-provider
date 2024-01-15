// 1. download the provider package through the termial using the command:
// flutter pub get provider

//2. create a new class for our provider that extends from ChangeNotifier
// third step in main.dart
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

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
    // var checked = todos[todos.indexwhere(element) => elemnt.id]),  checked.done != checked.done]

    todos[id - 1].done = !todos[id - 1].done;
    notifyListeners();
  }
}
