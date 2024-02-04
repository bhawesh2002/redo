import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  const TodoAppBar({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.1);
}
