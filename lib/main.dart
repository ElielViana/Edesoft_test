import 'package:flutter/material.dart';
import 'package:task_list/pages/home/home_page.dart';
import 'package:task_list/pages/task_add/task_add_page.dart';

void main() {
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
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (_) => HomePage());

          case TaskAddPage.routeName:
            return MaterialPageRoute(builder: (_) => TaskAddPage());
          default:
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
    );
  }
}
