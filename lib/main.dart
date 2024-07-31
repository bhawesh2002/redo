import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:redo/pages/home.dart';
import 'package:redo/utils/enums/prirority.dart';
import 'package:redo/utils/measurements/uisizes.dart';
import 'package:redo/utils/models/todo.dart';
import 'package:redo/utils/theme/app_colors.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PrirorityAdapter());
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  await Hive.openBox<Todo>('archivedTodos');
  await Hive.openBox<Todo>('completedTodos');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    UiSizes().init(context); //initialize UiSizes
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.silver['50'],
          fontFamily: 'GalanoGrotesque'),
      home: HomePage(),
    );
  }
}
