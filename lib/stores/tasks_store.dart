import 'package:mobx/mobx.dart';
import 'package:task_list/models/task_model.dart';
part 'tasks_store.g.dart';

class TasksStore = _TaskStoreBase with _$TasksStore;

abstract class _TaskStoreBase with Store {
  @observable
  ObservableList<TaskModel> tasks = <TaskModel>[].asObservable();

  @action
  void addTask(TaskModel task) {
    tasks.add(task);
  }

  @action
  void removeTask(TaskModel task) {
    tasks.removeWhere((element) => element.id == task.id);
  }
}
