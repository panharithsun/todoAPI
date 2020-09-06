import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/todo_item.dart';
import 'package:provider_demo/providers/todos_provider.dart';
import 'package:provider_demo/screens/todos_screen/todo_ui.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // when the screen first renders
    // we fetch the list of todos
    TodosProvider todosProvider =
        Provider.of<TodosProvider>(context, listen: false);
    try {
      // run the fetchTodos function
      todosProvider.fetchTodos();
    } catch (e) {
      // this block of code will run when ever there is an error
      // in the try block. In this case i'm just going to print out
      // the error
      print(e);
    }
  }

  void onAddTodoButtonPressed() async {
    TodoItem newTodo = TodoItem(
      content: textFieldController.text,
      isDone: false,
    );
    
    TodosProvider todosProvider = Provider.of<TodosProvider>(
      context,
      listen: false,
    );

    todosProvider.addTodo(newTodo);
    textFieldController.clear();
  }

  // void onDeleteButtonPressed(int id) {
  //   // TodosProvider todosProvider = Provider.of<TodosProvider>(
  //   //   context,
  //   //   listen: false,
  //   // );
  //   // todosProvider.removeTodo(id);
  //   print('doggos');
  // }

  // void onUpdateStatusButtonPressed(int id) async {
  //   TodosProvider todosProvider = Provider.of<TodosProvider>(
  //     context,
  //     listen: false,
  //   );
  //   todosProvider.updateTodo(id);
  //   // setState(() {
  //   //   todoItem.isDone = true;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodosProvider>(
      builder: (
        BuildContext context,
        TodosProvider todosProvider,
        Widget child,
      ) {
        return TodoUI(
          todos: todosProvider.todos,
          textFieldController: textFieldController,
          onAddTodoButtonPressed: onAddTodoButtonPressed,
        );
      },
    );
  }
}
