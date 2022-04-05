import 'package:flutter/material.dart';

class OneActivityScaffold extends StatelessWidget {
  const OneActivityScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return const Material(
      child: Center(
        child: Text("My particular Activity"),
      ),
    );
  }
}