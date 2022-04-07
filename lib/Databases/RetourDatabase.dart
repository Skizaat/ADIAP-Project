import 'dart:async';
import 'dart:io';
import 'package:adiap/Classes/Proposition.dart';
import 'package:adiap/Classes/Retours.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Classes/User.dart';


class RetourSQLiteDbProvider {
  RetourSQLiteDbProvider._();
  static final RetourSQLiteDbProvider db = RetourSQLiteDbProvider._();
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
    String path = join(documentsDirectory.path, "retour_database.db");
    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Retour(idRetour INTEGER PRIMARY KEY, idOneActivity INTEGER, stateGly TEXT, commentary TEXT)");
        });
  }

  Future<List<Retour>> getAllOnes() async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "Retour", columns: Proposition.columns, orderBy: "idRetour ASC");
    List<Retour> AllRetour = [];
    results?.forEach((result) {
      Retour retour = Retour.fromMap(result);
      AllRetour.add(retour);
    });
    return AllRetour;
  }

  Future<Retour> getById(int idOne) async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "Retour", columns: Proposition.columns, where: "idOne = ?", whereArgs: [idOne]);
    List<Retour> AllRetour = [];
    results?.forEach((result) {
      Retour retour = Retour.fromMap(result);
      AllRetour.add(retour);
    });
    return AllRetour[0];
  }

  insert(Retour retour) async {
    final db = await database;
    var maxIdResult = await db?.rawQuery("SELECT MAX(idRetour)+1 as last_inserted_id FROM Retour");
    var id = maxIdResult?.first["last_inserted_id"];
    var result = await db?.rawInsert("INSERT Into Retour (idRetour, idOneActivity, stateGly, commentary)"
        " VALUES (?, ?, ?, ?)",
      [id, retour.idOneActivity, retour.stateGly, retour.commentary],
    );
    return result;
  }

  update(Retour retour) async {
    final db = await database;
    var result = await db?.update(
        "Retour", retour.toMap(), where: "idRetour = ?", whereArgs: [retour.idRetour]
    );
    return result;
  }

  delete(int id) async {
    final db = await database;
    db?.delete("Retour", where: "idRetour = ?", whereArgs: [id]);
  }
}