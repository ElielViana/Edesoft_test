import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/pages/task_add/task_add_controller.dart';

class TaskAddPage extends StatefulWidget {
  TaskAddPage({Key? key}) : super(key: key);
  static const String routeName = '/TaskAddPage';
  @override
  _TaskAddPageState createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  final controller = GetIt.I.get<TaskAddController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addTask();
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: controller.taskNameController,
            decoration: InputDecoration(hintText: 'Nome da tarefa'),
          ),
        ),
      ),
    );
  }
}
