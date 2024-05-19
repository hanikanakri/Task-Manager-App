import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDataBase {
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
    String path = join(await getDatabasesPath(), 'tasks.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    debugPrint('================database has been upgrade==================');
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes" (
      "id" INTEGER,
      "userId" INTEGER,
      "todo" TEXT
    )
  ''');
    debugPrint('================database has been create==================');
  }

  readDatabase(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    debugPrint('================database has been read==================');
    return response;
  }

  insertDatabase(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    debugPrint('================database has been insert==================');
    return response;
  }

  updateDatabase(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    debugPrint('================database has been update==================');
    return response;
  }

  deleteMyDatabase(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    debugPrint('================database has been delete==================');
    return response;
  }

  deleteAllDatabase() async {
    debugPrint(
        '================database has been all deleted==================');
    String path = join(await getDatabasesPath(), 'tasks.db');
    await deleteDatabase(path);
  }

  closeDatabase() async {
    debugPrint('================database has been closed==================');
    await _db!.close();
  }
}
