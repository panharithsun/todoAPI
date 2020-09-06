import 'package:flutter/material.dart';
import 'package:provider_demo/components/todo_card.dart';
import 'package:provider_demo/models/todo_item.dart';

class TodoUI extends StatelessWidget {
  const TodoUI({
    this.todos,
    this.textFieldController,
    this.onAddTodoButtonPressed,
    this.onDeleteButtonPressed,
    this.onUpdateStatusButtonPressed
  });

  final Function onAddTodoButtonPressed;
  final Function onDeleteButtonPressed;
  final Function onUpdateStatusButtonPressed;
  final TextEditingController textFieldController;
  final List<TodoItem> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                return TodoItemCard(
                  todoItem: e,
                  onDeleteButtonPressed: onDeleteButtonPressed,
                  onUpdateStatusButtonPressed: onUpdateStatusButtonPressed,
                );
              }),
            ],
          )
        ),
      ),
    );
  }
}
