import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Todos App',
      style: TextStyle(color: Colors.red, fontSize: 50),
      textAlign: TextAlign.center,
    );
  }
}
