import 'package:flutter/material.dart';

import 'package:todo_provider_app/providers/todo_provider.dart';
import 'package:todo_provider_app/widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'),
            icon: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<TodoProvider>(
            builder: (context, todoProvider, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) =>
                    TodoTile(todo: todoProvider.todos[index]))),
      ),
    );
  }
}
