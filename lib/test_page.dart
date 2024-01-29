import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/todo.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TaskWidget(),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.85,
      height: height * 0.2,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Column(
            children: [
              Text(
                constraints.toString(),
              ),
              Text("Container Width ${width * 0.85}"),
              Text("Container Height ${height * 0.2}"),
              const TaskValue(
                index: 2,
                field: Field.title,
              )
            ],
          );
        },
      ),
    );
  }
}
