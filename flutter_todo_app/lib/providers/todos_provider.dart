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
    // initialize the TodoServices class
    TodoServices todoServices = TodoServices();
    // run the addTodo function in TodoServices class to post the todo into the api
    todoServices.addTodo(todoItem.content);
    // todoServices.removeTodo(todoItem.id);

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

  void removeTodo(int id) {
    // initialize the TodoServices class
    TodoServices todoServices = TodoServices();
    // run the updateStatus function in TodoServices class to update the todo status into the api
    todoServices.removeTodo(id);
    notifyListeners();
  }

  void updateTodo(int id) {
    // initialize the TodoServices class
    TodoServices todoServices = TodoServices();
    // run the updateStatus function in TodoServices class to update the todo status into the api
    todoServices.updateStatus(id);
    notifyListeners();
  }

}
