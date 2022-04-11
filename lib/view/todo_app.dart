import 'package:flutter/material.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/widgets/title_widget.dart';
import 'package:to_do/widgets/todo_list_item_widget.dart';
import 'package:to_do/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();
  List<TodoModel> allTodos = [
    TodoModel(id: const Uuid().v4(), description: 'Todo 1'),
    TodoModel(id: const Uuid().v4(), description: 'Todo 2'),
    TodoModel(id: const Uuid().v4(), description: 'Todo 3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TitleWidget(),
          TextField(
            onSubmitted: (todo) {
              debugPrint('Şunu Ekle : ' + todo);
            },
            controller: newTodoController,
            decoration: InputDecoration(labelText: 'Bugün Neler Yapacaksın?'),
          ),
          SizedBox(height: 20),
          ToolBarWidget(),
          SizedBox(height: 20),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
                key: ValueKey(allTodos[i].id),
                onDismissed: (_) {},
                child: TodoListItemWidget(item: allTodos[i])),
        ],
      ),
    );
  }
}
