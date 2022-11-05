import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath(); //مسار حفظ الملف
    String path = p.join(databasePath, 'library.db'); //اسم الداتا بيز
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );
    return mydb;
  }

//انشاء الجدول
  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        'CREATE TABLE "persons" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "first_name" TEXT, "second_name" TEXT, "email" TEXT, "password" TEXT)');

    batch.execute(
        'CREATE TABLE "library" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "first_name" TEXT, "second_name" TEXT, "email" TEXT, "city" TEXT, "password" TEXT)');

    await batch.commit();
  }

//
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  //
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  //
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  //
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
