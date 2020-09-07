import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/todo_item.dart';
import 'package:provider_demo/providers/todos_provider.dart';

class TodoItemCard extends StatefulWidget {
  const TodoItemCard(
      {Key key,
      @required this.todoItem,
      @required this.onDeleteButtonPressed,
      @required this.onUpdateStatusButtonPressed})
      : super(key: key);

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
                      widget.todoItem.isDone = newValue;
                      TodosProvider todosProvider =
                          Provider.of<TodosProvider>(context, listen: false);
                      todosProvider.updateTodo(widget.todoItem.id, newValue);
                    },
                  ),
                ),
                Wrap(
                  children: [
                    Text(
                      widget.todoItem.content,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                TodosProvider todosProvider = Provider.of<TodosProvider>(context, listen: false);
                todosProvider.removeTodo(widget.todoItem.id);
              },
              icon: Icon(Icons.delete),
            )
          ],
        ));
  }
}
