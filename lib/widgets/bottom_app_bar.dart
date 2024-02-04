import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';

class TodoBottomAppBar extends StatefulWidget {
  const TodoBottomAppBar({super.key});

  @override
  State<TodoBottomAppBar> createState() => _TodoBottomAppBarState();
}

class _TodoBottomAppBarState extends State<TodoBottomAppBar> {
  int _currentindex = 1;
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
                _currentindex = 1;
              });
              debugPrint("Current index: $_currentindex");
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _currentindex = 2;
              });
              debugPrint("Current index: $_currentindex");
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.donut_large,
                  color: Colors.black,
                ),
                Text(
                  "Stats",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
