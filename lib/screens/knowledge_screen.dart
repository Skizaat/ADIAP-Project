import 'package:flutter/material.dart';
import 'package:adiap/Databases/ActivityDatabase.dart';

class KnowledgeScaffold extends StatelessWidget {
  const KnowledgeScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plus d\'infos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
          child: Center(
            child: ElevatedButton(
              child: const Text("suppr"),
              onPressed: () {
                SQLiteDbProvider.db.delete(8);
              },
            ),
          ),
        ), //Container
      ),
    );
  }
}