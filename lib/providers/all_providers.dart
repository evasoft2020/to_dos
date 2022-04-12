import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

enum TodoListFilter { all, active, completed }

final todoListFilter = StateProvider((ref) => TodoListFilter.all);

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>(
  (ref) {
    return TodoListManager([
      TodoModel(id: const Uuid().v4(), description: 'Spora git'),
      TodoModel(id: const Uuid().v4(), description: 'Alışveriş yap'),
      TodoModel(id: const Uuid().v4(), description: 'Ders çalış'),
    ]);
  },
);

final filteredTodoList = Provider<List<TodoModel>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todoList = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.all:
      return todoList;
    case TodoListFilter.active:
      return todoList.where((todo) => !todo.completed).toList();
    case TodoListFilter.completed:
      return todoList.where((todo) => todo.completed).toList();
  }
});

final unCompletedTodoCount = Provider(
  (ref) {
    final allTodos = ref.watch(todoListProvider);
    final count = allTodos.where((element) => !element.completed).length;
    return count;
  },
);

final currentTodoProvider = Provider<TodoModel>(
  (ref) {
    throw UnimplementedError();
  },
);
