import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  List<TodoModel> todos = [];

  bool isDark = false;

  void addTodo() {
    if (controller.text.isNotEmpty) {
      setState(() {
        todos.add(
          TodoModel(title: controller.text),
        );
      });

      controller.clear();
    }
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void toggleComplete(bool? value, int index) {
    setState(() {
      todos[index].isCompleted = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark
          ? ThemeData.dark()
          : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo Practice App'),
          actions: [
            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter Todo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addTodo,
                  child: const Text('Add Todo'),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      todo: todos[index],
                      onDelete: () => deleteTodo(index),
                      onChanged: (value) =>
                          toggleComplete(value, index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController controller = TextEditingController();

  List<TodoModel> todos = [];

  bool isDark = false;

  void addTodo() {
    if (controller.text.isNotEmpty) {
      setState(() {
        todos.add(
          TodoModel(title: controller.text),
        );
      });

      controller.clear();
    }
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void toggleComplete(bool? value, int index) {
    setState(() {
      todos[index].isCompleted = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark
          ? ThemeData.dark()
          : ThemeData.light(),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),

          actions: [

            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
              },
            ),

          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              TextField(
                controller: controller,

                decoration: const InputDecoration(
                  hintText: 'Enter Todo',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: addTodo,
                  child: const Text('Add Todo'),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,

                  itemBuilder: (context, index) {

                    return TodoTile(
                      todo: todos[index],
                      onDelete: () => deleteTodo(index),
                      onChanged: (value) =>
                          toggleComplete(value, index),
                    );

                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}