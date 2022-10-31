import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("api using provider"),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final todos = value.todos;
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(todos[index].toString()),
                  ),
                  title: Text(todos[index].title,
                      style: TextStyle(
                        color:
                            todos[index].completed ? Colors.grey : Colors.red,
                      )),
                );
              }));
        },
      ),
    );
  }
}
