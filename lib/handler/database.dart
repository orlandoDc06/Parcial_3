import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  String databaseName = 'db_gastos';

  Future<Database> getDataBase()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, databaseName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async{
    await db.execute(''' CREATE TABLE gastos(id INTEGER PRIMARY KEY, monto REAL, categoria TEXT, descripcion TEXT, fecha TEXT )''');
  }
}