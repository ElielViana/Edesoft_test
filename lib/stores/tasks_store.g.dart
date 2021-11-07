// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksStore on _TaskStoreBase, Store {
  final _$tasksAtom = Atom(name: '_TaskStoreBase.tasks');

  @override
  ObservableList<TaskModel> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskModel> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase');

  @override
  void addTask(TaskModel task) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(TaskModel task) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
