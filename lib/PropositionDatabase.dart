import 'dart:async';
import 'dart:io';
import 'package:adiap/Classes/Proposition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Classes/User.dart';


class PropSQLiteDbProvider {
  PropSQLiteDbProvider._();
  static final PropSQLiteDbProvider db = PropSQLiteDbProvider._();
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
    String path = join(documentsDirectory.path, "proposition_database.db");
    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Proposition(idProposition INTEGER PRIMARY KEY, idOneActivity INTEGER, proposition TEXT)");
        });
  }

  Future<List<Proposition>> getAllOnes() async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "Proposition", columns: Proposition.columns, orderBy: "idProposition ASC");
    List<Proposition> AllProp = [];
    results?.forEach((result) {
      Proposition prop = Proposition.fromMap(result);
      AllProp.add(prop);
    });
    print(results);
    return AllProp;
  }

  Future<Proposition> getById(int idOne) async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "Proposition", columns: Proposition.columns, where: "idProposition = ?", whereArgs: [idOne]);
    List<Proposition> AllProp = [];
    results?.forEach((result) {
      Proposition prop = Proposition.fromMap(result);
      AllProp.add(prop);
    });
    print(results);
    return AllProp[0];
  }

  insert(Proposition prop) async {
    final db = await database;
    var maxIdResult = await db?.rawQuery("SELECT MAX(idProposition)+1 as last_inserted_id FROM Proposition");
    var id = maxIdResult?.first["last_inserted_id"];
    var result = await db?.rawInsert("INSERT Into Proposition (idProposition, idOneActivity, proposition)"
        " VALUES (?, ?, ?)",
      [id, prop.idOneActivity, prop.proposition],
    );
    return result;
  }

  update(Proposition prop) async {
    final db = await database;
    var result = await db?.update(
        "Proposition", prop.toMap(), where: "idProposition = ?", whereArgs: [prop.idProposition]
    );
    return result;
  }

  delete(int id) async {
    final db = await database;
    db?.delete("Proposition", where: "idProposition = ?", whereArgs: [id]);
  }
}

