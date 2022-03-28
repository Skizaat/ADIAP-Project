import 'package:adiap/main_screen.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: [
          const Expanded(
            child: Center(
                child: Text('Bienvenue dans ADIAP')
            ),
          ),
          ElevatedButton(
              child: const Text('Créer mon profil'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainRoute()));
              }
          ),
          /*Container(
              height: 60,
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(color: Colors.blue[500]),
              alignment: Alignment.center,
              child: Text('Créer mon profil')
          ) */
        ],
      ),
    );
  }
}

class WelcomeRoute extends StatelessWidget {
  const WelcomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyScaffold();
  }
}