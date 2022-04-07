import 'package:flutter/material.dart';
import 'package:adiap/Databases/ActivityDatabase.dart';

class KnowledgeScaffold extends StatelessWidget {
  const KnowledgeScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      child: Center(
        child: ElevatedButton(
          child: const Text("suppr"),
          onPressed: () {
              SQLiteDbProvider.db.delete(8);
          },
        ),
      ),
    );
  }
}