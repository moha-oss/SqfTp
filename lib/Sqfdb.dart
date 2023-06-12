import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqfdb {
  static Database? _db;
  Future<Database?> get db async {
    if (db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'fruits.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      create table "Fruit"(
        'id' integer not null primery key autoincrement,
        'name' text not null
      )
    ''');
    print('onCreate ==============================');
  }

  readData(String s) async {
    Database? mydb = await db;
    String sql = 'select * from "Fruit"';
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  delatetData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
