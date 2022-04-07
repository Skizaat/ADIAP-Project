import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Classes/User.dart';


class UserSQLiteDbProvider {
  UserSQLiteDbProvider._();
  static final UserSQLiteDbProvider db = UserSQLiteDbProvider._();
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
    String path = join(documentsDirectory.path, "user_database.db");
    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT, weight INT, diabTreatment TEXT)");
        });
  }

  Future<List<User>> getAllOnes() async {
    final db = await database;
    List<Map<String, Object?>>? results = await db?.query(
        "User", columns: User.columns, orderBy: "id ASC");
    List<User> AllUser = [];
    results?.forEach((result) {
      User OneU = User.fromMap(result);
      AllUser.add(OneU);
    });
    print(results);
    return AllUser;
  }

  insert(User user) async {
    final db = await database;
    var maxIdResult = await db?.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM User");
    var id = maxIdResult?.first["last_inserted_id"];
    var result = await db?.rawInsert("INSERT Into User (id, name, weight, diabTreatment)"
        " VALUES (?, ?, ?, ?)",
      [id, user.name, user.weight, user.diabTreatment],
    );
    return result;
  }

  update(User user) async {
    final db = await database;
    var result = await db?.update(
        "User", user.toMap(), where: "id = ?", whereArgs: [user.id]
    );
    return result;
  }

  delete(int id) async {
    final db = await database;
    db?.delete("User", where: "id = ?", whereArgs: [id]);
  }
}














/*import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'Classes/User.dart';

class FileHandler {

  // Makes this a singleton class, as we want only want a single
  // instance of this object for the whole application
  FileHandler._privateConstructor();
  static final FileHandler instance = FileHandler._privateConstructor();

  static File? _file;

  static final _fileName = 'user_file.txt';

  // Get the data file
  Future<File> get file async {
    if (_file != null) return _file!;

    _file = await _initFile();
    return _file!;
  }

  // Inititalize file
  Future<File> _initFile() async {
    final _directory = await getApplicationDocumentsDirectory();
    final _path = _directory.path;
    return File('$_path/$_fileName');
  }

  static Set<User> _userSet = {};

  Future<void> writeUser(User user) async {
    final File fl = await file;
    _userSet.add(user);

    // Now convert the set to a list as the jsonEncoder cannot encode
    // a set but a list.
    final _userListMap = _userSet.map((e) => e.toJson()).toList();

    await fl.writeAsString(jsonEncode(_userListMap));
  }

  Future<List<User>> readUsers() async {
    final File fl = await file;
    final _content = await fl.readAsString();

    final List<dynamic> _jsonData = jsonDecode(_content);
    final List<User> _users = _jsonData
        .map(
          (e) => User.fromJson(e as Map<String, dynamic>),
    )
        .toList();
    return _users;
  }

  Future<void> deleteUser(User user) async {
    final File fl = await file;

    _userSet.removeWhere((e) => e == user);
    final _userListMap = _userSet.map((e) => e.toJson()).toList();

    await fl.writeAsString(jsonEncode(_userListMap));
  }

  Future<void> updateUser({
    required int id,
    required User updatedUser,
  }) async {
    _userSet.removeWhere((e) => e.id == updatedUser.id);
    await writeUser(updatedUser);
  }
}*/
