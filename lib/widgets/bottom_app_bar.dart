import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';

class TodoBottomAppBar extends StatefulWidget {
  const TodoBottomAppBar({super.key});

  @override
  State<TodoBottomAppBar> createState() => _TodoBottomAppBarState();
}

class _TodoBottomAppBarState extends State<TodoBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
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
            onTap: () {},
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
