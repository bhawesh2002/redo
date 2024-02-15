import 'package:flutter/material.dart';

Future<void> accountDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SimpleDialog(
        children: [
          Center(
            child: Text("Account Dialog"),
          )
        ],
      );
    },
  );
}
