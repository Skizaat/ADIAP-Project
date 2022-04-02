// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'routes.dart';
import 'Classes/activity.dart';



void main() async {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: WelcomeRoute(),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'activities_database.db'),
  onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE activities(idActivity INTEGER PRIMARY KEY, nameActivity TEXT, intensity TEXT, day TEXT, hour INTEGER)',
    );
  },
  version: 1,
  );

  Future<void> insertActivity(Activity activity) async {
    final db = await database;
    await db.insert('activities', activity.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  Future<List<Activity>> activity() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('activities');

    return List.generate(maps.length, (i) {
      return Activity(idActivity: maps[i]['idActivity'], nameActivity: maps[i]['nameActivity'], intensity: maps[i]['intensity'], day: maps[i]['day'], hour: maps[i]['hour']);
    });
  }

  Future<void> updateActivity(Activity activity) async {
    final db = await database;
    await db.update('activities', activity.toMap(), where: 'idActivity = ?', whereArgs: [activity.idActivity]);
  }

  Future<void> deleteActivity(int idActivity) async {
    final db = await database;
    await db.delete('activities', where: 'idActivity = ? ', whereArgs: [idActivity]);
  }

  var Tennis = const Activity(idActivity: 01, nameActivity: 'Tennis' , intensity: 'légère', day: 'samedi', hour: 15);
  await insertActivity(Tennis);

  print(await activity());

  Tennis = Activity(idActivity: Tennis.idActivity, nameActivity: Tennis.nameActivity, intensity: 'Intense', day: Tennis.day, hour: Tennis.hour);
  await updateActivity(Tennis);
  print(await activity());

  await deleteActivity(Tennis.idActivity);
  print(await activity());
}


