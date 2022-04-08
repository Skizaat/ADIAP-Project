import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Activity {
  final int idActivity;
  final String nameActivity;
  final String intensity;
  final String day;
  final int hour;
  static final columns = ["idActivity", "nameActivity", "intensity", "day", "hour"];

  const Activity ({
    required this.idActivity,
    required this.nameActivity,
    required this.intensity,
    required this.day,
    required this.hour,
  });

  factory Activity.fromMap(Map<dynamic, dynamic> data) {
    return Activity(
      idActivity: data["idActivity"], nameActivity: data['nameActivity'], intensity: data['intensity'], day: data['day'], hour: data['hour'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idActivity' : idActivity,
      'nameActivity' : nameActivity,
      'intensity' : intensity,
      'day' : day,
      'hour' : hour,
    };
  }

  @override
  String toString() {
    return 'Activity{idActivity: $idActivity, nameActivity: $nameActivity, intensity: $intensity, day: $day, hour: $hour}';
  }

  String getNameActivity() {
    return nameActivity;
  }

  String getDay() {
    return day;
  }

  int getHour() {
    return hour;
  }

  int getId() {
    return idActivity;
  }
}



