import 'package:task_list/database/local_database.dart';
import 'package:task_list/models/task_model.dart';

class TaskRepository {
  final LocalDataBase database;
  TaskRepository({required this.database});

  Future<void> createTask(TaskModel task) async {
    database.instance
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO task (id, name, createdAt) VALUES (\"${task.id}\", \"${task.name}\", \"${task.createAt.toString()}\")'))
        .then((value) => print(value));
  }

  Future<List<TaskModel>> getAllTask() async {
    List<TaskModel> tasks = [];
    List taskList = await database.instance.rawQuery('SELECT * FROM task');
    if (taskList.isEmpty) {
      return tasks;
    }
    taskList.forEach((element) {
      TaskModel task = TaskModel.fromJson(element);
      tasks.add(task);
    });

    return tasks;
  }
}
