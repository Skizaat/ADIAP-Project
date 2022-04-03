import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Activity {
  final int idActivity;
  final String nameActivity;
  final String intensity;
  final String day;
  final int hour;

  const Activity ({
    required this.idActivity,
    required this.nameActivity,
    required this.intensity,
    required this.day,
    required this.hour,
  });

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


}



