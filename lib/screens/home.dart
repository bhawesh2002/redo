import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/screens/stats.dart';
import 'package:redo/widgets/appbar.dart';
import 'package:redo/widgets/todo_bottom_app_bar_item.dart';
import 'package:redo/widgets/task_widget.dart';
import 'package:redo/todo.dart';
import 'package:redo/widgets/taskfilter.dart';
import 'package:redo/widgets/tasktile.dart';

List<String> filterLabel = [
  "Upcoming",
  "All Tasks",
  "Completed",
  "Skipped",
];

// ignore: constant_identifier_names
enum BottomNavItem { Home, Stats }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = BottomNavItem.Home.index;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TodoAppBar(context: context),
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
              if (_selectedIndex == BottomNavItem.Stats.index) {
                return const Stats();
              } else {
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
                                        horizontal:
                                            constraints.maxWidth * 0.02),
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
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColor.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (_selectedIndex != BottomNavItem.Home.index) {
                    setState(() {
                      _selectedIndex = BottomNavItem.Home.index;
                      debugPrint("Page no: $_selectedIndex");
                    });
                  }
                },
                child: TodoBottomAppBarItem(
                  label: BottomNavItem.Home.toString().split(".").last,
                  icon: Icons.home,
                  isSelected: _selectedIndex.isEven,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_selectedIndex != BottomNavItem.Stats.index) {
                    setState(() {
                      _selectedIndex = BottomNavItem.Stats.index;
                      debugPrint("Page no: $_selectedIndex");
                    });
                  }
                },
                child: TodoBottomAppBarItem(
                  label: BottomNavItem.Stats.toString().split(".").last,
                  icon: Icons.donut_large,
                  isSelected: _selectedIndex.isOdd,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          splashColor: Colors.teal.shade50,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
