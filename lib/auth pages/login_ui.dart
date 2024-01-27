import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            actionButton(context, "Login"),
            const Padding(padding: EdgeInsets.all(30)),
            seperation("OR"),
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

Widget seperation(String seperationName) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Text(
          seperationName,
          style: TextStyle(
              color: Colors.grey.shade800, fontWeight: FontWeight.w500),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Expanded(
          child: Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    ),
  );
}

Widget authAlternatives(BuildContext context, String label,
    {String imgPath = ''}) {
  double buttonWidth = MediaQuery.of(context).size.width * 0.4;
  double buttonHeight = MediaQuery.of(context).size.height * 0.06;
  return GestureDetector(
    onTap: () {
      debugPrint("Logging with $label");
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(buttonWidth),
      ),
      width: buttonWidth,
      height: buttonHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: imgPath.isEmpty
                  ? const Icon(Icons.alternate_email)
                  : SvgPicture.asset(imgPath),
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}
