import 'package:flutter/material.dart';
import 'package:redo/assets/colors/colors.dart';
import 'package:redo/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            redoLogo(context, 0.3),
            const Padding(padding: EdgeInsets.all(30)),
            actionButton(context, "Login")
          ],
        ),
      ),
    );
  }
}

Widget actionButton(BuildContext context, String actionName) {
  double containerWidth = MediaQuery.of(context).size.width * 0.6;
  double containerHeight = MediaQuery.of(context).size.height * 0.06;
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(containerWidth * 0.05),
      ),
      width: containerWidth,
      height: containerHeight,
      child: Center(
        child: Text(
          actionName,
          style: const TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
