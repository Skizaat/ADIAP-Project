import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';

class HistoricActivityScaffold extends StatelessWidget {
  final Activity concernedActivity;

  const HistoricActivityScaffold({Key, key, required this.concernedActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return const Material(
      child: Center(
        child: Text("Historic"),
      ),
    );
  }
}