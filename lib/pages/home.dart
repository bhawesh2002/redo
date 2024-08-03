import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redo/controllers/todos_hive_controller.dart';
import 'package:redo/utils/measurements/uisizes.dart';
import 'package:redo/utils/sample%20data/sample_todo_data.dart';
import 'package:redo/utils/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodosHiveController _todosHiveController =
      Get.put(TodosHiveController());

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> testTodos = TestTodos().todos;
    return SafeArea(
      child: Obx(
        () => Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.emrald['500'],
                  ),
                  child: Center(
                    child: Text(
                      "ARCHIVES",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.emrald['50'],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _todosHiveController.archivedTodos.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _todosHiveController.archivedTodos.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                _todosHiveController.archivedTodos[index].title,
                                style: TextStyle(
                                  decoration: _todosHiveController
                                          .archivedTodos[index].isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                _todosHiveController
                                        .archivedTodos[index].description ??
                                    '',
                                style: TextStyle(
                                    decoration: _todosHiveController
                                            .archivedTodos[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _todosHiveController
                                          .undoArchivedTodo(index);
                                    },
                                    icon: Icon(
                                      Icons.undo,
                                      color: AppColors.emrald['400'],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _todosHiveController
                                          .deletePermanently(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete_forever,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: UiSizes().h10,
                            ),
                            const Text(' No Archived Todos',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "REDO",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.emrald['500'],
                      ),
                    ),
                    Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        style: IconButton.styleFrom(
                            backgroundColor: AppColors.emrald['500']),
                        icon: Icon(
                          Icons.archive,
                          color: AppColors.emrald['50'],
                        ),
                      );
                    })
                  ],
                ),
              ),
              Expanded(
                child: _todosHiveController.todos.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: UiSizes().w80,
                              child: const Text(
                                "Start by creating a new Todo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            IconButton(
                              onPressed: () {
                                _todosHiveController.addTodoItem(
                                  title: testTodos[Random()
                                      .nextInt(testTodos.length)]['title'],
                                  description: testTodos[
                                          Random().nextInt(testTodos.length)]
                                      ['description'],
                                  location: testTodos[Random()
                                      .nextInt(testTodos.length)]['location'],
                                  tags: testTodos[Random()
                                      .nextInt(testTodos.length)]['tags'],
                                  colorHex: testTodos[Random()
                                      .nextInt(testTodos.length)]['colorHex'],
                                  priority: testTodos[Random()
                                      .nextInt(testTodos.length)]['priority'],
                                  scheduledAt: testTodos[
                                          Random().nextInt(testTodos.length)]
                                      ['scheduledAt'],
                                  reminderAt: testTodos[Random()
                                      .nextInt(testTodos.length)]['reminderAt'],
                                );
                              },
                              style: IconButton.styleFrom(
                                foregroundColor: AppColors.emrald['500'],
                                backgroundColor: Colors.white,
                                elevation: 10,
                                padding: EdgeInsets.all(UiSizes().w4),
                                shadowColor: AppColors.emrald['300'],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                iconSize: 32,
                              ),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _todosHiveController.todos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {},
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            title: Text(
                              _todosHiveController.todos[index].title,
                              style: TextStyle(
                                decoration:
                                    _todosHiveController.todos[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000 +
                                    int.parse(
                                        _todosHiveController
                                                .todos[index].colorHex
                                                ?.replaceAll('#', '') ??
                                            '000000',
                                        radix: 16)),
                              ),
                            ),
                            subtitle: Text(
                              _todosHiveController.todos[index].description ??
                                  '',
                              style: TextStyle(
                                decoration:
                                    _todosHiveController.todos[index].isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                fontWeight: FontWeight.w500,
                                color: AppColors.silver['700'],
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                _todosHiveController.archiveTodo(index);
                              },
                              icon: Icon(
                                Icons.archive,
                                color: AppColors.silver['400'],
                              ),
                            ),
                            leading: IconButton(
                                onPressed: () {
                                  _todosHiveController.toggleTodoStatus(index);
                                },
                                icon: Icon(
                                  _todosHiveController.todos[index].isDone
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: AppColors.emrald['500'],
                                  size: 26,
                                )),
                          );
                        },
                      ),
              ),
            ],
          ),
          floatingActionButton: _todosHiveController.todos.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    _todosHiveController.addTodoItem(
                      title: testTodos[Random().nextInt(testTodos.length)]
                          ['title'],
                      description: testTodos[Random().nextInt(testTodos.length)]
                          ['description'],
                      location: testTodos[Random().nextInt(testTodos.length)]
                          ['location'],
                      tags: testTodos[Random().nextInt(testTodos.length)]
                          ['tags'],
                      colorHex: testTodos[Random().nextInt(testTodos.length)]
                          ['colorHex'],
                      priority: testTodos[Random().nextInt(testTodos.length)]
                          ['priority'],
                      scheduledAt: testTodos[Random().nextInt(testTodos.length)]
                          ['scheduledAt'],
                      reminderAt: testTodos[Random().nextInt(testTodos.length)]
                          ['reminderAt'],
                    );
                  },
                  backgroundColor: AppColors.emrald['500'],
                  child: Icon(
                    size: 32,
                    Icons.add,
                    color: AppColors.emrald['50'],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
