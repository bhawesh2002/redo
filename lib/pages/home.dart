import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redo/controllers/todos_hive_controller.dart';
import 'package:redo/utils/measurements/uisizes.dart';
import 'package:redo/utils/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodosHiveController _todosHiveController =
      Get.put(TodosHiveController());

  @override
  Widget build(BuildContext context) {
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                  'Deleted At: ${_todosHiveController.archivedTodos[index].deletedAt!.toIso8601String().split('T')[1].split('.')[0]}'),
                              trailing: IconButton(
                                onPressed: () {
                                  _todosHiveController.deletePermanently(index);
                                },
                                icon: const Icon(Icons.delete_forever),
                              ),
                            );
                          },
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: UiSizes().h10,
                            ),
                            const Text(' No Archived Todos'),
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
                                    title: 'Buy Milk and Bread',
                                    description:
                                        'Buy Milk and Bread from the store near the house',
                                    scheduledAt: DateTime.now()
                                        .add(const Duration(days: 1)));
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
                            onTap: () {
                              _todosHiveController.updateTodo(
                                index,
                                title: 'Buy Milk, Bread and Eggs',
                                description:
                                    'Buy Milk, Bread and Eggs from the store near the house called "The Milk Store" and "The Bread Store"',
                              );
                            },
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            title: Text(
                              _todosHiveController.todos[index].title,
                              style: TextStyle(
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
                                  'No Description Provided',
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                _todosHiveController.deleteTodo(index);
                              },
                              icon: const Icon(Icons.archive),
                            ),
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
                      title: 'workout at the gym',
                      description: 'workout at the gym for 1 hour daily',
                      scheduledAt: DateTime.now().add(
                        const Duration(days: 1),
                      ),
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
