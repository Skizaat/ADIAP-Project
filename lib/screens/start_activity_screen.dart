import 'package:adiap/ActivityDatabase.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:adiap/routes.dart';


class StartActivityScaffold extends StatelessWidget {
  final Activity startingActivity;

  const StartActivityScaffold({Key, key, required this.startingActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 100,
      width: 200,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1)
      ),
      child: Column(
          children: [
            Text(startingActivity.getNameActivity(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text(startingActivity.getDay(), style: const TextStyle(fontSize: 18),),
            Text(startingActivity.getHour().toString() + ' h', style: const TextStyle(fontSize: 18),),
          ]
      ),
    );
  }
}