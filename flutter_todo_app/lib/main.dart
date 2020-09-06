import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/todos_provider.dart';
import 'package:provider_demo/screens/todos_screen/todos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => TodosProvider(),
          ),
        ],
        child: TodoScreen(),
      ),
    );
  }
}
