import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/database/local_database.dart';
import 'package:task_list/pages/home/home_controller.dart';
import 'package:task_list/pages/home/home_page.dart';
import 'package:task_list/pages/init/init_page.dart';
import 'package:task_list/pages/task_add/task_add_controller.dart';
import 'package:task_list/pages/task_add/task_add_page.dart';
import 'package:task_list/repositories/task_repository.dart';
import 'package:task_list/stores/tasks_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerSingleton(TasksStore());
  getIt.registerSingleton(LocalDataBase());
  getIt.registerFactory(() => TaskRepository(database: getIt.get()));
  getIt.registerFactory(
      () => TaskAddController(taskStore: getIt.get(), repository: getIt.get()));
  getIt.registerFactory(
      () => HomeController(repository: getIt.get(), taskStore: getIt.get()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: InitPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (_) => HomePage());

          case TaskAddPage.routeName:
            return MaterialPageRoute(builder: (_) => TaskAddPage());

          case InitPage.routeName:
            return MaterialPageRoute(builder: (_) => InitPage());

          default:
            return MaterialPageRoute(builder: (_) => InitPage());
        }
      },
    );
  }
}
