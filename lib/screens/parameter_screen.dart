import 'package:flutter/material.dart';

class ParameterScaffold extends StatelessWidget {
  const ParameterScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Material(
          child: Center(
            child: Text("Paramètres"),
          ), //Text
        ), //Container
      ),
    );
  }
}