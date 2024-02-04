import 'package:flutter/material.dart';
import 'package:redo/widgets/redologo.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  const TodoAppBar({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.1;
    return SizedBox(
      height: appBarHeight,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                children: [
                  redoLogo(context, appBarHeight * 0.0015, false),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                  ),
                  Text(
                    "Redo",
                    style: TextStyle(
                      fontSize: appBarHeight * 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: CircleAvatar(
                radius: appBarHeight * 0.4,
                backgroundColor: Colors.white,
                child: Image.asset('lib/assets/images/avataaars.png'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.1);
}
