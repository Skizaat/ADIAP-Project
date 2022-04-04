import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Classes/activity.dart';


class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "activities_database.db");
    return await openDatabase(
      path,
    version: 1,
    onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Activities(idActivity INTEGER PRIMARY KEY, nameActivity TEXT, intensity TEXT, day TEXT, hour INTEGER)");
    });
  }

  Future<List<Activity>> getAllActivities() async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "Activities", columns: Activity.columns, orderBy: "idActivity ASC");
    List<Activity> activities = [];
    results?.forEach((result) {
      Activity activity = Activity.fromMap(result);
      activities.add(activity);
    });
    print(activities);
    return activities;
  }
    
    insert(Activity activity) async {
      print("avant insert");
      final db = await database;
      print("après insert");
      var maxIdResult = await db?.rawQuery("SELECT MAX(idActivity)+1 as last_inserted_id FROM Activities");
      var id = maxIdResult?.first["last_inserted_id"];
      var result = await db?.rawInsert("INSERT Into Activities (idActivity, nameActivity, intensity, day, hour)"
          " VALUES (?, ?, ?, ?, ?)",
          [id, activity.nameActivity, activity.intensity, activity.day, activity.hour],
      );
      print("that's ok");
      return result;
    }

    update(Activity activity) async {
      final db = await database;
      var result = await db?.update(
        "Activities", activity.toMap(), where: "idActivity = ?", whereArgs: [activity.idActivity]
      );
      return result;
    }

    delete(int id) async {
      final db = await database;
      db?.delete("Activities", where: "idActivity = ?", whereArgs: [id]);
    }
}

