import 'package:flutter/material.dart';

import 'package:todo_provider_app/models/todos.dart';
import 'package:todo_provider_app/providers/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: ListTile(
          title: Text(todo.title),
          leading: IconButton(
              onPressed: () {
                // there is another way with lana
                context.read<TodoProvider>().deleteTodo(todo.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
          trailing: Checkbox(
            fillColor: MaterialStateProperty.all<Color>(Colors.white),
            checkColor: Colors.amber.shade300,
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Colors.amber.shade300),
            ),
            value: todo.done,
            onChanged: (value) =>
                {context.read<TodoProvider>().todoChecked(todo.id)},
          ),
        ),
      ),
    );
  }
}
