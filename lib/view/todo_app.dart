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
    var allTodos = ref.watch(filteredTodoList);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            onSubmitted: (todo) {
              ref.read(todoListProvider.notifier).addTodo(todo);
            },
            controller: newTodoController,
            decoration:
                const InputDecoration(labelText: 'Bugün Neler Yapacaksın?'),
          ),
          const SizedBox(height: 20),
          ToolBarWidget(),
          allTodos.length == 0
              ? const Center(child: Text('Herhangi Bir Görev yok!'))
              : const SizedBox(),
          const SizedBox(height: 20),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
                key: ValueKey(allTodos[i].id),
                onDismissed: (_) {
                  ref.read(todoListProvider.notifier).remove(allTodos[i]);
                },
                child: ProviderScope(overrides: [
                  currentTodoProvider.overrideWithValue(allTodos[i])
                ], child: TodoListItemWidget())),
        ],
      ),
    );
  }
}
