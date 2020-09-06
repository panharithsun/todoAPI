
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_demo/models/todo_item.dart';
import 'package:provider_demo/providers/todos_provider.dart';

class TodoItemCard extends StatefulWidget {
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
  _TodoItemCardState createState() => _TodoItemCardState();
}

class _TodoItemCardState extends State<TodoItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Checkbox(
                  value: widget.todoItem.isDone,
                  onChanged: (newValue) {
                    setState(() {
                      widget.todoItem.isDone = newValue;
                      TodosProvider todosProvider = TodosProvider();
                      todosProvider.updateTodo(widget.todoItem.id);
                    });
                  },
                ),
              ),
              Text(
                widget.todoItem.content,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              TodosProvider todosProvider = TodosProvider();
              todosProvider.removeTodo(widget.todoItem.id);
              setState(() {
                
              });
            },
            icon: Icon(Icons.delete),
          )
        ],
      )
    );
  }
}
