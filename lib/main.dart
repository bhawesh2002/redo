import 'package:flutter/material.dart';

void main() => runApp(const Redo());

class Redo extends StatelessWidget {
  const Redo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redo',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
