import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/task_widget.dart';
import 'package:redo/todo.dart';
import 'package:redo/widgets.dart';

List<String> filterLabel = [
  "Upcoming",
  "All Tasks",
  "Completed",
  "Skipped",
];

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: FutureBuilder(
          future: getTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text("No tasks Available");
            } else {
              List<Todo> taskList = snapshot.data ?? [];
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                child: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                  return Column(
                    children: [
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
                      TaskWidget(
                        index: 2,
                        taskList: taskList,
                      ),
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
                                      horizontal: constraints.maxWidth * 0.02),
                                  child: TaskTile(
                                    index: index,
                                    taskList: taskList,
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  final int index;
  final List<Todo> taskList;
  const TaskTile({super.key, required this.index, required this.taskList});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isCompleted = false;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double tileWidth = MediaQuery.of(context).size.width * 0.85;
    double tileHeight = MediaQuery.of(context).size.height * 0.08;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: tileWidth,
      height: isExpanded ? (tileHeight * 2) : tileHeight,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: tileHeight * 0.15,
        horizontal: tileWidth * 0.01,
      ),
      child: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: (value) {
                  setState(() {
                    isCompleted = value!;
                  });
                },
                activeColor: AppColor.primaryColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.taskList[widget.index].title,
                      style: TextStyle(
                          fontSize: constraints.maxWidth * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: constraints.maxWidth * 0.7,
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.7,
                        maxHeight: isExpanded
                            ? constraints.maxHeight * 0.8
                            : constraints.maxHeight * 0.1,
                      ),
                      child: Text(
                        widget.taskList[widget.index].description,
                        softWrap: true,
                        overflow: isExpanded ? null : TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: constraints.maxWidth * 0.035,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: isExpanded
                    ? const Icon(Icons.keyboard_arrow_up_rounded)
                    : const Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TaskFilter extends StatefulWidget {
  final BoxConstraints constraints;
  const TaskFilter({super.key, required this.constraints});
  @override
  State<TaskFilter> createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth,
      height: widget.constraints.maxHeight * 0.035,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.01),
                child: FilterOption(
                  constraints: constraints,
                  filterLabel: filterLabel[index],
                  isSelected: selectedIndex == index,
                  onSelected: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class FilterOption extends StatelessWidget {
  final BoxConstraints constraints;
  final String filterLabel;
  bool isSelected;
  final VoidCallback onSelected;
  FilterOption({
    super.key,
    required this.constraints,
    required this.filterLabel,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(constraints.maxWidth * 0.05),
            border: Border.all(width: 1, color: AppColor.primaryColor),
            color: isSelected ? AppColor.primaryColor : Colors.white),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
          child: Center(
            child: Text(
              filterLabel,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: isSelected ? null : 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
