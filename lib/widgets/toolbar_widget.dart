import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  ToolBarWidget({Key? key}) : super(key: key);
  var _currentFilter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filter) {
    return _currentFilter == filter ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onComplatedTodoCount = ref.watch(unCompletedTodoCount);
    _currentFilter = ref.watch(todoListFilter);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
              onComplatedTodoCount == 0
                  ? 'Tüm Görevler Tamamlandı'
                  : onComplatedTodoCount.toString() + ' Todos',
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
        Tooltip(
          message: 'All Todos',
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.all)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.all;
              ;
            },
            child: Text('All'),
          ),
        ),
        Tooltip(
          message: 'Active Todos',
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.active)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.active;
            },
            child: Text('Active'),
          ),
        ),
        Tooltip(
          message: 'Completed Todos',
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.completed)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state =
                  TodoListFilter.completed;
            },
            child: Text('Completed'),
          ),
        )
      ],
    );
  }
}
