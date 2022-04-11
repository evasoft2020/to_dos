import 'package:flutter/material.dart';
import 'package:to_do/widgets/title_widget.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TitleWidget(),
        ],
      ),
    );
  }
}
