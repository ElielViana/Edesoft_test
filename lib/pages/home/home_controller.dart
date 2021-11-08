import 'package:task_list/repositories/task_repository.dart';
import 'package:task_list/stores/tasks_store.dart';

class HomeController {
  HomeController({required this.repository, required this.taskStore});

  late TaskRepository repository;
  late TasksStore taskStore;

  getAllTask() async {
    final tasks = await repository.getAllTask();
    taskStore.setTasksList(tasks);
  }
}
