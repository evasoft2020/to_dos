import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var onComplatedTodoCount =
        ref.watch(todoListProvider).where((todo) => !todo.completed).length;
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
            onPressed: () {},
            child: Text('All'),
          ),
        ),
        Tooltip(
          message: 'Active Todos',
          child: TextButton(
            onPressed: () {},
            child: Text('Active'),
          ),
        ),
        Tooltip(
          message: 'Completed Todos',
          child: TextButton(
            onPressed: () {},
            child: Text('Completed'),
          ),
        )
      ],
    );
  }
}
