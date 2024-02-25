import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/todo.dart';
import 'package:redo/utilis/days.dart';
import 'package:redo/widgets/task_widget.dart';
import 'package:redo/widgets/taskfilter.dart';
import 'package:redo/widgets/tasktile.dart';

class Tasks extends StatefulWidget {
  const Tasks({
    super.key,
  });

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTasks(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: AppColor.primaryColor,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else {
          List<Todo> taskList = snapshot.data!;
          return taskList.isEmpty
              ? const Center(
                  child: Text("Create a new task using \"+\""),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                text: DateTime.now().day.toInt().toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                children: [
                                  const TextSpan(text: " "),
                                  TextSpan(
                                    text: months[
                                        DateTime.now().month.toInt() - 1],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  const TextSpan(text: ", "),
                                  TextSpan(
                                    text: weekday[DateTime.now().weekday - 1],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.01),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Ongoing,",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.01),
                          ),
                          TaskWidget(index: 0, taskList: taskList),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.01),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Tasks",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.005),
                          ),
                          TaskFilter(constraints: constraints),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight * 0.01),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: constraints.maxHeight * 0.5,
                              child: ListView.builder(
                                itemCount: taskList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: constraints.maxHeight * 0.01,
                                        horizontal:
                                            constraints.maxWidth * 0.02),
                                    child: TaskTile(
                                        index: index,
                                        taskList: taskList,
                                        isCompleted:
                                            taskList[index].isCompleted,
                                        onChecked: (value) {
                                          debugPrint("Completed");
                                          setState(() {
                                            updateTask(task: taskList[index],newTitle: "Code");
                                          });
                                        }),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
        }
      },
    );
  }
}

// Padding(
//       padding: EdgeInsets.symmetric(
//           vertical: MediaQuery.of(context).size.height * 0.01,
//           horizontal: MediaQuery.of(context).size.width * 0.04),
//       child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
//         return Column(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: RichText(
//                 text: TextSpan(
//                   text: DateTime.now().day.toInt().toString(),
//                   style: const TextStyle(color: Colors.black, fontSize: 20),
//                   children: [
//                     const TextSpan(text: " "),
//                     TextSpan(
//                       text: months[DateTime.now().month.toInt() - 1],
//                       style: const TextStyle(color: Colors.black, fontSize: 20),
//                     ),
//                     const TextSpan(text: ", "),
//                     TextSpan(
//                       text: weekday[DateTime.now().weekday - 1],
//                       style: const TextStyle(color: Colors.black, fontSize: 20),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.01),
//             ),
//             const Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Ongoing,",
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.01),
//             ),
//             TaskWidget(
//               index: 0,
//               taskList: taskList!,
//             ),
//             Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.01),
//             ),
//             const Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Tasks",
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.005),
//             ),
//             TaskFilter(constraints: constraints),
//             Padding(
//               padding:
//                   EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.01),
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: constraints.maxHeight * 0.5,
//                 child: ListView.builder(
//                     itemCount: taskList!.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: constraints.maxHeight * 0.01,
//                             horizontal: constraints.maxWidth * 0.02),
//                         child: TaskTile(
//                           index: index,
//                           taskList: taskList!,
//                         ),
//                       );
//                     }),
//               ),
//             )
//           ],
//         );
//       }),
//     );