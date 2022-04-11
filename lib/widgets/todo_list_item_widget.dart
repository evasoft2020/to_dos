import 'package:flutter/material.dart';
import 'package:to_do/models/todo_model.dart';

class TodoListItemWidget extends StatelessWidget {
  final TodoModel item;
  const TodoListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: true,
        onChanged: (value) {
          debugPrint(value.toString());
        },
      ),
      title: Text(item.description),
    );
  }
}
