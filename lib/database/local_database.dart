// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDataBase {
  String? path;
  Database? _instance;

  Database get instance => _instance!;

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'tasks.db');

    _instance = await openDatabase(path!, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE task (id TEXT PRIMARY KEY, name TEXT, createdAt datetime)');
    });
  }
}
