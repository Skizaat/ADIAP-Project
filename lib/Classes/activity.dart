import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Activity {
  final int idActivity;
  final String nameActivity;
  final String intensity;
  final String day;
  final int hour;
  int offset_time;
  int offset_pourc;
  static final columns = ["idActivity", "nameActivity", "intensity", "day", "hour", "offset_time", "offset_pourc"];

  Activity ({
    required this.idActivity,
    required this.nameActivity,
    required this.intensity,
    required this.day,
    required this.hour,
    required this.offset_time,
    required this.offset_pourc
  });

  factory Activity.fromMap(Map<dynamic, dynamic> data) {
    return Activity(
      idActivity: data["idActivity"], nameActivity: data['nameActivity'], intensity: data['intensity'], day: data['day'], hour: data['hour'], offset_time: data['offset_time'], offset_pourc: data["offset_pourc"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idActivity' : idActivity,
      'nameActivity' : nameActivity,
      'intensity' : intensity,
      'day' : day,
      'hour' : hour,
      'offset_time' : offset_time,
      'offset_pourc' : offset_pourc,
    };
  }

  @override
  String toString() {
    return 'Activity{idActivity: $idActivity, nameActivity: $nameActivity, intensity: $intensity, day: $day, hour: $hour, offset_time: $offset_time, offset_pourc: $offset_pourc}';
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

  int getoffsettime()  {
    return offset_time;
  }

  int getoffsettpourc() {
    return offset_pourc;
  }
}



