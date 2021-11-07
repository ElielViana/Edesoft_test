import 'package:flutter/cupertino.dart';
import 'package:task_list/models/task_model.dart';
import 'package:task_list/repositories/task_repository.dart';
import 'package:task_list/stores/tasks_store.dart';
import 'package:uuid/uuid.dart';

class TaskAddController {
  TaskAddController({required this.taskStore, required this.repository});

  TextEditingController taskNameController = TextEditingController();
  late TasksStore taskStore;
  late TaskRepository repository;

  TaskModel get newTask => TaskModel(
      name: taskNameController.text.trim(),
      createAt: DateTime.now(),
      id: Uuid().v4());
  void addTask() async {
    await repository.createTask(newTask);
    taskStore.addTask(newTask);
  }
}
