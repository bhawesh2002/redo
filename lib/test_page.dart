import 'package:flutter/material.dart';
import 'package:redo/task_widget.dart';
import 'package:redo/widgets.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Redo"),
        leading: redoLogo(context, 0.2),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        actions: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.04,
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TaskWidget(),
          ],
        ),
      ),
    );
  }
}
