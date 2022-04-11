import 'package:flutter/material.dart';
import 'package:to_do/widgets/title_widget.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();

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
        ],
      ),
    );
  }
}
