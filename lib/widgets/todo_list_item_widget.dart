import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
  const TodoListItemWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoListItemWidgetState();
}

class _TodoListItemWidgetState extends ConsumerState<TodoListItemWidget> {
  late FocusNode _textFocusNode;
  late TextEditingController _textEditingController;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var currentTodo = ref.watch(currentTodoProvider);
    return Focus(
      onFocusChange: (isFocused) {
        if (!isFocused) {
          setState(() {
            _hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(
              id: currentTodo.id, newDescription: _textEditingController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
            _textEditingController.text = currentTodo.description;
            _textFocusNode.requestFocus();
          });
        },
        leading: Checkbox(
          value: currentTodo.completed,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggle(currentTodo.id);
          },
        ),
        title: _hasFocus
            ? TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
              )
            : Text(currentTodo.description),
      ),
    );
  }
}
