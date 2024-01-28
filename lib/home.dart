import 'package:flutter/material.dart';
import 'package:redo/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: redoLogo(context, 0.2),
          title: const Text("Redo"),
        ),
      ),
    );
  }
}
