import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

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
