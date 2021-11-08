import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/database/local_database.dart';
import 'package:task_list/pages/home/home_page.dart';

class InitPage extends StatefulWidget {
  InitPage({Key? key}) : super(key: key);
  static const String routeName = '/InitPage';
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    final database = GetIt.I.get<LocalDataBase>();
    await database.init();
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushNamed(HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
