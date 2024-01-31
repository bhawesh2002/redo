import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/todo.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  const TaskWidget({super.key, required this.index});
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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: TaskValue(
                      index: index,
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
                            index: index,
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
                                side: const BorderSide(
                                    color: AppColor.primaryColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_left_rounded,
                                  size: width * 0.04,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Prev",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: width * 0.025,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: AppColor.primaryColor),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: width * 0.025,
                                      color: Colors.black),
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
              ),
              Container(
                width: constraints.maxWidth * 0.005,
                height: constraints.maxHeight,
                color: Colors.grey.shade300,
              ),
              CircularProgressWidget(index: index)
            ],
          );
        },
      ),
    );
  }
}

class CircularProgressWidget extends StatefulWidget {
  final int index;
  final Size indicatorSize;
  const CircularProgressWidget(
      {super.key,
      required this.index,
      this.indicatorSize = const Size(50, 50)});

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget> {
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  double progress = 0;
  double remaining = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _updateTimeValues(widget.index);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        progress = calculateProgress();
        remaining = calculateRemaining();
      });
    });
  }

  @override
  void dispose() {
    if (progress == 1.0) {
      timer.cancel();
    }
    super.dispose();
  }

  Future<void> _updateTimeValues(int index) async {
    List<Todo> tasks = await getTasks();
    setState(() {
      startTime = tasks[index].start;
      endTime = tasks[index].end;
    });
    DateTime now = DateTime.now();
    debugPrint('nowTime: ${now.toString()}');
    debugPrint('startTime: $startTime');
    debugPrint('endTime: $endTime');
  }

  double calculateProgress() {
    DateTime now = DateTime.now();
    if (now.isBefore(startTime)) {
      return 0.0;
    } else if (now.isAfter(endTime)) {
      return 1.0;
    } else {
      double totalDuration = endTime.difference(startTime).inSeconds.toDouble();
      double elapsedDuration = now.difference(startTime).inSeconds.toDouble();
      return elapsedDuration / totalDuration;
    }
  }

  double calculateRemaining() {
    DateTime now = DateTime.now();
    double totalDuration = endTime.difference(startTime).inMinutes.toDouble();
    double elapsedDuration = now.difference(startTime).inMinutes.toDouble();
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
