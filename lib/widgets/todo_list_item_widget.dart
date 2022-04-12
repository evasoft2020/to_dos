import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerWidget {
  final TodoModel item;
  const TodoListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: item.completed,
        onChanged: (value) {
          ref.read(todoListProvider.notifier).toggle(item.id);
        },
      ),
      title: Text(item.description),
    );
  }
}
