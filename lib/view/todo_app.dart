import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/providers/all_providers.dart';
import 'package:to_do/widgets/title_widget.dart';
import 'package:to_do/widgets/todo_list_item_widget.dart';
import 'package:to_do/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TitleWidget(),
          TextField(
            onSubmitted: (todo) {
              ref.read(todoListProvider.notifier).addTodo(todo);
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
                onDismissed: (_) {
                  ref.read(todoListProvider.notifier).remove(allTodos[i]);
                },
                child: TodoListItemWidget(item: allTodos[i])),
        ],
      ),
    );
  }
}
