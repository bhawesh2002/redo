import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/screens/stats.dart';
import 'package:redo/screens/tasks.dart';
import 'package:redo/widgets/appbar.dart';
import 'package:redo/widgets/create_task_bottom_sheet.dart';
import 'package:redo/widgets/todo_bottom_app_bar_item.dart';

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
        body: _selectedIndex == 0 ? const Tasks() : const Stats(),
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
              context: context,
              showDragHandle: true,
              builder: (BuildContext context) {
                return const CreateBottomTaskSheet();
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
