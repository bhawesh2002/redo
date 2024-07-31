import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:redo/utils/models/todo.dart';

class TodosHiveController extends GetxController {
  List<Todo> todos = <Todo>[].obs; // Track the todos list
  late final Box<Todo> todosBox; // Hive box to store the todos

  @override
  void onInit() {
    super.onInit();
    todosBox = Hive.box<Todo>('todos'); // Open the Hive box
    todos.addAll(
        todosBox.values.toList().cast<Todo>()); // Add all the todos to the list
  }

  // function to add a todo item
  void addTodoItem(Todo todo) async {
    try {
      await todosBox.add(todo);
      todos.add(todo);
    } catch (e) {
      debugPrint('addTodoItem() error: $e');
    }
  }

  // function to delete a todo item at a given index
  void deleteTodo(int index) async {
    try {
      await todosBox.deleteAt(index);
      todos.removeAt(index);
    } catch (e) {
      debugPrint('deleteTodo() error: $e');
    }
  }
}
