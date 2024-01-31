import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
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
            Padding(padding: EdgeInsets.all(10)),
            TaskTile(),
          ],
        ),
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
