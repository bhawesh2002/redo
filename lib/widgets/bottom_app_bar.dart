// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';

enum BottomNavItem { Home, Status }

class TodoBottomAppBar extends StatefulWidget {
  const TodoBottomAppBar({super.key});

  @override
  State<TodoBottomAppBar> createState() => _TodoBottomAppBarState();
}

class _TodoBottomAppBarState extends State<TodoBottomAppBar> {
  BottomNavItem selectedNavItem = BottomNavItem.Home;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedNavItem = BottomNavItem.Home;
              });
            },
            child: bottomAppBarItem(BottomNavItem.Home, Icons.home),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  selectedNavItem = BottomNavItem.Status;
                });
              },
              child: bottomAppBarItem(BottomNavItem.Status, Icons.donut_large))
        ],
      ),
    );
  }

  Widget bottomAppBarItem(BottomNavItem item, IconData icon) {
    bool isSelected = selectedNavItem == item;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
        ),
        Text(
          item.toString().split('.').last, // Extracting the enum name
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
