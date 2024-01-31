import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/todo.dart';
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

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.85,
      height: height * 0.18,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.03),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: TaskValue(
                  index: 1,
                  field: Field.title,
                  textStyle: TextStyle(
                      fontSize: width * 0.04, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.05),
                  child: SizedBox(
                    width: constraints.maxWidth * 0.70,
                    height: constraints.maxHeight * 0.5,
                    child: SingleChildScrollView(
                      child: TaskValue(
                        index: 1,
                        field: Field.description,
                        textStyle: TextStyle(
                          fontSize: width * 0.03,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: constraints.maxWidth * 0.70,
                  height: constraints.maxHeight * 0.20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(color: AppColor.primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_left_rounded,
                              size: width * 0.04,
                              color: Colors.black,
                            ),
                            Text(
                              "Previous",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: width * 0.025, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColor.primaryColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: width * 0.025, color: Colors.black),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: width * 0.04,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
