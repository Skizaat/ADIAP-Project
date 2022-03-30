import 'package:flutter/material.dart';
import 'package:adiap/routes.dart';

class ActivityScaffold extends StatelessWidget {
  const ActivityScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return const Material(
      child: Center(
        child: Text("Activités"),
      ),
    );
  }
}