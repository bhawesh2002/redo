import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/screens/stats.dart';
import 'package:redo/screens/tasks.dart';
import 'package:redo/widgets/appbar.dart';
import 'package:redo/widgets/todo_bottom_app_bar_item.dart';
import 'package:redo/todo.dart';

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
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No tasks Available"));
            } else {
              List<Todo> taskList = snapshot.data ?? [];
              if (_selectedIndex == BottomNavItem.Stats.index) {
                return const Stats();
              } else {
                return Tasks(
                  taskList: taskList,
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
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.transparent,
                  child: TodoBottomAppBarItem(
                    label: BottomNavItem.Home.toString().split(".").last,
                    icon: Icons.home,
                    isSelected: _selectedIndex.isEven,
                  ),
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
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.transparent,
                  child: TodoBottomAppBarItem(
                    label: BottomNavItem.Stats.toString().split(".").last,
                    icon: Icons.donut_large,
                    isSelected: _selectedIndex.isOdd,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          splashColor: Colors.teal.shade50,
          onPressed: () {
            showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Create New Task",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Title",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: AppColor.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.teal.shade100,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Description",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: AppColor.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.teal.shade100,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    size: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                    ),
                                  ),
                                  Text(
                                    "Task Date",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                ],
                              ),
                              const Text("Select Date"),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                    ),
                                  ),
                                  Text(
                                    "Start Time",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    size: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.01,
                                    ),
                                  ),
                                  Text(
                                    "End Time",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Create",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
