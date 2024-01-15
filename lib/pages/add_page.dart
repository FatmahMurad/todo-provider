import 'package:flutter/material.dart';

import 'package:todo_provider_app/providers/todo_provider.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        backgroundColor: Colors.amber.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                controller: todoController,
                decoration: InputDecoration(
                  hintText: 'Your todo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().addTodo(name: todoController.text);

                context.pop();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
