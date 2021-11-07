import 'package:task_list/database/local_database.dart';
import 'package:task_list/models/task_model.dart';

class TaskRepository {
  final LocalDataBase database;
  TaskRepository({required this.database});

  createTask(TaskModel task) {
    database.instance
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO task (id, name, createdAt) VALUES (\"${task.id}\", \"${task.name}\", \"${task.createAt.toString()}\")'))
        .then((value) => print(value));
  }
}
