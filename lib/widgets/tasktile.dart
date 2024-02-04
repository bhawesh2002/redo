import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/todo.dart';

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
                    child: SizedBox(
                      width: constraints.maxWidth * 0.7,
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
