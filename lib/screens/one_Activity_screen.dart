import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';

class OneActivityScaffold extends StatelessWidget {
  final Activity currentActivity;

  const OneActivityScaffold({Key, key, required this.currentActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      child: Center(
        child: Text(currentActivity.getNameActivity()),
      ),
    );
  }
}