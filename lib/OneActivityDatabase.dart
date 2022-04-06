import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Classes/OneActivity.dart';


class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
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
          await db.execute("CREATE TABLE OnesActivity(idOne INTEGER PRIMARY KEY, aimglycemie INTEGER, actglycemie INTEGER, timebefore INTEGER, timemeal INTEGER, idAssociatedActivity INTEGER)");
        });
  }

  Future<List<OneActivity>> getAllOnes() async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "OnesActivity", columns: OneActivity.columns, orderBy: "idOne ASC");
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
    var maxIdResult = await db?.rawQuery("SELECT MAX(idActivity)+1 as last_inserted_id FROM Activities");
    var id = maxIdResult?.first["last_inserted_id"];
    var result = await db?.rawInsert("INSERT Into OnesActivity (idOne, aimglycemie, actglycemie, timebefore, timemeal, idAssociatedActivity)"
        " VALUES (?, ?, ?, ?, ?, ?)",
      [id, One.aimglycemie, One.actglycemie, One.timebefore, One.timemeal, One.idAssociatedActivity],
    );
    print("that's ok");
    return result;
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

