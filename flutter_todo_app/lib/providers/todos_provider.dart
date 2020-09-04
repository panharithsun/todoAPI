import 'package:flutter/material.dart';
import 'package:provider_demo/models/todo_item.dart';
import 'package:provider_demo/services/todos_services.dart';

class TodosProvider extends ChangeNotifier {
  List<TodoItem> _todos = [];
  List<TodoItem> get todos => this._todos;
  set todos(List<TodoItem> _newTodos) {
    this._todos = _newTodos;
  }

  void addTodo(TodoItem todoItem) {
    this._todos.add(todoItem);
    notifyListeners();
  }

  void fetchTodos() async {
    // initialize the TodoServices class
    TodoServices todoServices = TodoServices();
    // run the fetchTodos function in TodoServices class to get all todos from backend
    List<TodoItem> __todos = await todoServices.fetchTodos();
    // update the _todos variable
    this._todos = __todos;
    // notify the ui to change
    notifyListeners();
  }
}
