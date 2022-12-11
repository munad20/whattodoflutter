import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo {
  Todo({required this.title});
  final String title;
}

class Task extends StatelessWidget {
  Task({
    required this.todo,
  }) : super(key: ObjectKey(todo));

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
    );
  }
}

class WhatToDoList extends StatefulWidget {
  @override
  _WhatToDoListState createState() => new _WhatToDoListState();
}

class _WhatToDoListState extends State<WhatToDoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatToDo?'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: _todos.map((Todo todo) {
          return Task(
            todo: todo,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddTodoDialog,
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }

  void _showAddTodoDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            controller: _textFieldController,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('WhatToDo'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodo(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }

  void _addTodo(String title) {
    setState(() {
      _todos.add(Todo(title: title));
    });
    _textFieldController.clear();
  }
}
