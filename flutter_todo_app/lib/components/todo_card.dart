
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_demo/models/todo_item.dart';
import 'package:provider_demo/providers/todos_provider.dart';

class TodoItemCard extends StatelessWidget {
  const TodoItemCard({
    Key key, 
    @required this.todoItem,
    @required this.onDeleteButtonPressed,
    @required this.onUpdateStatusButtonPressed
  }) : super(key: key);

  final Function onDeleteButtonPressed;
  final Function onUpdateStatusButtonPressed;
  final TodoItem todoItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  TodosProvider todosProvider = TodosProvider();
                  todosProvider.updateTodo(todoItem.id);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: (todoItem.isDone) ? Icon(Icons.check) : null,
                ),
              ),
              Text(
                todoItem.content,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              TodosProvider todosProvider = TodosProvider();
              todosProvider.removeTodo(todoItem.id);
            },
            icon: Icon(Icons.delete),
          )
        ],
      )
    );
  }
}
