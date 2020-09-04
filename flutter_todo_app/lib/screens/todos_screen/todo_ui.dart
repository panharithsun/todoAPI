import 'package:flutter/material.dart';
import 'package:provider_demo/models/todo_item.dart';

class TodoUI extends StatelessWidget {
  const TodoUI({
    this.todos,
    this.textFieldController,
    this.onAddTodoButtonPressed,
  });

  final Function onAddTodoButtonPressed;
  final TextEditingController textFieldController;
  final List<TodoItem> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textFieldController,
                  ),
                ),
                FlatButton(
                  onPressed: onAddTodoButtonPressed,
                  child: Text("Add Todo"),
                ),
              ],
            ),
            ...todos.map((TodoItem e) {
              return Text(e.content);
            }),
          ],
        ),
      ),
    );
  }
}
