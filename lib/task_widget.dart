import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/todo.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  final List<Todo> taskList;
  const TaskWidget({super.key, required this.index, required this.taskList});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.90,
      height: height * 0.18,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.04),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      taskList[index].title,
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: constraints.maxHeight * 0.05),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: constraints.maxWidth * 0.70,
                      child: SingleChildScrollView(
                        child: Text(
                          taskList[index].description,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: constraints.maxWidth * 0.005,
                height: constraints.maxHeight,
                color: Colors.grey.shade300,
              ),
              CircularProgressWidget(
                index: index,
                startTime: taskList[index].start,
                endTime: taskList[index].end,
              )
            ],
          );
        },
      ),
    );
  }
}

class CircularProgressWidget extends StatefulWidget {
  final int index;
  final DateTime startTime;
  final DateTime endTime;
  final Size indicatorSize;
  const CircularProgressWidget({
    super.key,
    required this.index,
    required this.startTime,
    required this.endTime,
    this.indicatorSize = const Size(50, 50),
  });

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget> {
  double progress = 0;
  double remaining = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        progress = calculateProgress();
        remaining = calculateRemaining();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  double calculateProgress() {
    DateTime now = DateTime.now();
    if (now.isBefore(widget.startTime)) {
      return 0.0;
    } else if (now.isAfter(widget.endTime)) {
      return 1.0;
    } else {
      double totalDuration =
          widget.endTime.difference(widget.startTime).inSeconds.toDouble();
      double elapsedDuration =
          now.difference(widget.startTime).inSeconds.toDouble();
      return elapsedDuration / totalDuration;
    }
  }

  double calculateRemaining() {
    DateTime now = DateTime.now();
    double totalDuration =
        widget.endTime.difference(widget.startTime).inMinutes.toDouble();
    double elapsedDuration =
        now.difference(widget.startTime).inMinutes.toDouble();
    double remainingDuration = totalDuration - elapsedDuration;
    if (remainingDuration <= 0) {
      remainingDuration = 0;
    }
    return remainingDuration;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.indicatorSize.width,
          height: widget.indicatorSize.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: widget.indicatorSize.width,
                  height: widget.indicatorSize.height,
                  child: CircularProgressIndicator(
                    value: progress,
                    color: AppColor.primaryColor,
                    strokeWidth: 5,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: '${remaining.toInt()} ',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const TextSpan(
                text: 'min',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const Text(
          "Remaining",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
