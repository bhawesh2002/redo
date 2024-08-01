import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:redo/utils/enums/prirority.dart';
import 'package:redo/utils/models/todo.dart';
import 'package:uuid/uuid.dart';

class TodosHiveController extends GetxController {
  List<Todo> todos = <Todo>[].obs; // Track the todos list
  List<Todo> archivedTodos = <Todo>[].obs; // Track the archived todos list
  List<Todo> completedTodos = <Todo>[].obs; // Track the completed todos list
  late final Box<Todo> todosBox; // Hive box to store the todos
  late final Box<Todo> archivedTodosBox; // Hive box to store the archived todos
  @override
  void onInit() {
    super.onInit();
    todosBox = Hive.box<Todo>('todos'); // Open the todos Hive box
    todos.addAll(todosBox.values
        .toList()
        .cast<Todo>()); // Add all the todos to the todos list
    archivedTodosBox =
        Hive.box<Todo>('archivedTodos'); // Open the archived todos Hive box
    archivedTodos.addAll(archivedTodosBox.values
        .toList()
        .cast<Todo>()); // Add all the archived todos to the list
    debugPrint('todos length: ${todos.length}');
    debugPrint('archived length: ${archivedTodos.length}');
  }

  // function to add a todo item
  void addTodoItem(
      {required String title,
      String? description,
      String? location,
      List<String>? tags,
      String? colorHex,
      Prirority? priority,
      required DateTime scheduledAt,
      DateTime? reminderAt}) async {
    try {
      final String todoId =
          const Uuid().v4(); //Generate a unique id for the todo of format
      Todo newTodo = Todo(
        todoId: todoId,
        title: title,
        description: description ?? '', //Description is optional
        location: location ?? '', //Location is optional
        tags: tags ?? <String>[], //Tags is optional
        colorHex: colorHex ?? '#000000', //Color is optional
        priority: priority ?? Prirority.low, //Priority is optional
        scheduledAt: scheduledAt,
        reminderAt: reminderAt,
        createdAt: DateTime
            .now(), //Set the createdAt field to the current time (non-modifiable)
        updatedAt: DateTime.now(),
        isDone: false,
      );
      await todosBox.add(newTodo);
      todos.add(newTodo);
    } catch (e) {
      debugPrint('addTodoItem() error: $e');
    }
  }

  void toggleTodoStatus(int index) async {
    try {
      final Todo currentTodo = todos[index];
      final Todo updatedTodo = currentTodo.copyWith(
        isDone: !currentTodo.isDone,
        completedAt: currentTodo.isDone ? null : DateTime.now(),
      );
      // Update the todo item in the todos box
      await todosBox.putAt(index, updatedTodo);
      // Update the todos list
      todos[index] = updatedTodo;
    } catch (e) {
      debugPrint('toggleTodoStatus() error: $e');
    }
  }

  // function to delete a todo item at a given index which moves it to the archived todos
  void deleteTodo(int index) async {
    try {
      // First: Delete the todo item from the Hive box
      await todosBox.deleteAt(index);
      // Second: Copy the todo item (not deleted yet) from the todos list
      final Todo archivedTodo = todos[index].copyWith(
        deletedAt: DateTime.now(),
      );
      // Third: Add the copied todo item to the archivedTodos box and archivedTodos list
      archivedTodosBox.add(archivedTodo);
      archivedTodos.add(archivedTodo);
      // Fourth: Remove the todo item from the todos list
      todos.removeAt(index);
    } catch (e) {
      debugPrint('deleteTodo() error: $e');
    }
  }

  // function to delete a todo item permanently at a given index
  void deletePermanently(int index) async {
    try {
      await archivedTodosBox.deleteAt(index);
      archivedTodos.removeAt(index);
    } catch (e) {
      debugPrint('deletePermanently() error: $e');
    }
  }

  // function to update a todo item at a given index
  // Only the fields that need to be updated are passed as arguments
  // If a field is not passed, it will remain the same
  void updateTodo(
    int index, {
    String? title,
    String? description,
    String? location,
    String? cancellationReason,
    List<String>? tags,
    String? colorHex,
    Prirority? priority,
    DateTime? scheduledAt,
    DateTime? reminderAt,
  }) async {
    try {
      final Todo? currentTodo = todosBox.getAt(index); // Get the current todo
      final Todo updatedTodo = currentTodo!.copyWith(
        // Create a new todo with updated fields
        title: title ?? currentTodo.title,
        description: description ?? currentTodo.description,
        location: location ?? currentTodo.location,
        cancellationReason:
            cancellationReason ?? currentTodo.cancellationReason,
        tags: tags ?? currentTodo.tags,
        colorHex: colorHex ?? currentTodo.colorHex,
        priority: priority ?? currentTodo.priority,
        scheduledAt: scheduledAt ?? currentTodo.scheduledAt,
        reminderAt: reminderAt ?? currentTodo.reminderAt,
        updatedAt: DateTime.now(), //always update the updatedAt field
      );
      await todosBox.putAt(index, updatedTodo);
      todos[index] = updatedTodo;
    } catch (e) {
      debugPrint('updateTodo() error: $e');
    }
  }
}
