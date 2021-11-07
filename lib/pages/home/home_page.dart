import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:task_list/pages/task_add/task_add_page.dart';
import 'package:task_list/stores/tasks_store.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size screen;
  final store = GetIt.I.get<TasksStore>();
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xffF2F2F2),
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(TaskAddPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color(0xfff4f4f6),
      body: Container(
        color: Color(0xffF2F2F2),
        margin: EdgeInsets.all(16),
        width: screen.width,
        height: screen.height,
        child: Observer(builder: (context) {
          return ListView.builder(
            itemCount: store.tasks.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10.0,
                          offset: Offset(0.50, 0.75))
                    ]),
                // color: Colors.white,
                height: 50,
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          store.tasks[index].name,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text(
                            store.tasks[index].createAt.toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          color: Color(0xff1675F2),
                          width: 3,
                        )
                      ],
                    )),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
