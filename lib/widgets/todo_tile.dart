import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final VoidCallback onDelete;

  const TodoTile({
    super.key,
    required this.todo,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}