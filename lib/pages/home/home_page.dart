import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size screen;
  List taks = ['Reunião', 'Compras', 'Pagar Contas'];
  // List taks = ['Reunião'];
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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color(0xfff4f4f6),
      body: Container(
        color: Color(0xffF2F2F2),
        margin: EdgeInsets.all(16),
        width: screen.width,
        height: screen.height,
        child: Column(
          children: [
            Container(
              height: screen.height / 2,
              width: screen.width,
              child: ListView.builder(
                itemCount: taks.length,
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
                              taks[index],
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
                                '01 Nov',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
