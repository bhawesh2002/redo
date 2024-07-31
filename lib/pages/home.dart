import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redo/controllers/todos_hive_controller.dart';
import 'package:redo/utils/enums/prirority.dart';
import 'package:redo/utils/measurements/uisizes.dart';
import 'package:redo/utils/models/todo.dart';
import 'package:redo/utils/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodosHiveController _todosHiveController =
      Get.put(TodosHiveController());

  Todo _sampleTodoItem() => Todo(
        todoId: '6544565654',
        title: 'Test Todo Item',
        description: 'Item used during the testing of REDO',
        location: 'Kalmeshwar',
        cancellationReason: 'cancellationReason',
        isDone: false,
        tags: ['work', 'home'],
        colorHex: '#00fbff',
        priority: Prirority.medium,
        createdAt: DateTime.now(),
        scheduledAt: DateTime(2024, 7, 31, 9, 30),
        completionDate: DateTime(2024, 7, 31, 11, 59),
        completedAt: DateTime(2024, 7, 31),
        updatedAt: DateTime(2024, 7, 31),
        deletedAt: DateTime.now(),
        cancelledAt: DateTime.now(),
        reminderAt: DateTime(2024, 7, 31, 9, 15),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Text(
                  "REDO",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.emrald['500'],
                  ),
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
                                _todosHiveController
                                    .addTodoItem(_sampleTodoItem());
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
                                const EdgeInsets.symmetric(horizontal: 24),
                            title: Text(
                              '${_todosHiveController.todos[index].title} #${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000 +
                                    int.parse(
                                        _todosHiveController
                                                .todos[index].colorHex!
                                                .replaceAll('#', '') ??
                                            '000000',
                                        radix: 16)),
                              ),
                            ),
                            subtitle: Text(
                              _todosHiveController.todos[index].description,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                _todosHiveController.deleteTodo(index);
                              },
                              icon: const Icon(Icons.delete),
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
                    _todosHiveController.addTodoItem(_sampleTodoItem());
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
