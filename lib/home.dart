import 'package:flutter/material.dart';
import 'package:redo/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: redoLogo(context, 0.1),
          title: const Text("Redo"),
        ),
      ),
    );
  }
}
