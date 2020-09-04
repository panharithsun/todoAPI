import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_demo/models/todo_item.dart';

class TodoServices {
  Future<List<TodoItem>> fetchTodos() async {
    // sends http "get" request to get list of todos
    print("fetching...");
    http.Response response = await http
        .get('https://fathomless-inlet-42914.herokuapp.com/api/todos');
    // the response back is a json string. So we run the below code to convert it to a Map<String, dynamic>
    Map<String, dynamic> parsed = json.decode(response.body);
    // the json structure should be something like below
    // { "data": [ {"id": int, "status": bool, "title": string} ] }
    // so we are going to loop through the data and turn each elements into a TodoItem
    List<dynamic> data = parsed["data"];
    List<TodoItem> todos = data.map((dynamic e) {
      // here e = {"id": int, "status": bool, "title": string}
      // we are going to pass it into TodoItem.fromJson in order to turn e into a TodoItem
      return TodoItem.fromJson(e);
    }).toList();
    print(todos.toString());
    // return the list of todo items
    return todos;
  }
}
