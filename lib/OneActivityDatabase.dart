import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Classes/OneActivity.dart';


class OneSQLiteDbProvider {
  OneSQLiteDbProvider._();
  static final OneSQLiteDbProvider db = OneSQLiteDbProvider._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "onesactivity_database.db");
    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE OnesActivity(idOne INTEGER PRIMARY KEY, aimglycemie INTEGER, actglycemie INTEGER, timebefore INTEGER, timemeal INTEGER, idAssociatedActivity INTEGER, date TEXT)");
        });
  }

  Future<List<OneActivity>> getAllOnes() async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "OnesActivity", columns: OneActivity.columns, orderBy: "date ASC");
    List<OneActivity> Onesactivity = [];
    results?.forEach((result) {
      OneActivity One = OneActivity.fromMap(result);
      Onesactivity.add(One);
    });
    print(Onesactivity);
    return Onesactivity;
  }

  insert(OneActivity One) async {
    print("avant insert");
    final db = await database;
    print("après insert");
    var maxIdResult = await db?.rawQuery("SELECT MAX(idOne)+1 as last_inserted_id FROM OnesActivity");
    var id = maxIdResult?.first["last_inserted_id"];
    try {var result = await db?.rawInsert("INSERT Into OnesActivity (idOne, aimglycemie, actglycemie, timebefore, timemeal, idAssociatedActivity, date)"
        " VALUES (?, ?, ?, ?, ?, ?, ?)",
      [id, One.aimglycemie, One.actglycemie, One.timebefore, One.timemeal, One.idAssociatedActivity, One.date],
    );
    print("that's ok");
    return result;}
    catch (exception) {
      print('insert didn');
      print(exception);
    }

  }

  update(OneActivity One) async {
    final db = await database;
    var result = await db?.update(
        "OnesActivity", One.toMap(), where: "idOne = ?", whereArgs: [One.idOne]
    );
    return result;
  }

  delete(int id) async {
    final db = await database;
    db?.delete("OnesActivity", where: "idOne = ?", whereArgs: [id]);
  }
}

