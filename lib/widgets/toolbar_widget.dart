import 'package:flutter/material.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text('4 Todos'),
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
