import 'package:flutter/material.dart';
import 'package:adiap/routes.dart';
import 'package:adiap/create_perso.dart';

class WelcomeScaffold extends StatelessWidget {
  const WelcomeScaffold({Key? key}) : super(key: key);

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
            )
          ),
          ElevatedButton(
              child: const Text('Créer mon profil'),
              onPressed: () {
                main_profile();
              }
          ),
        ],
      ),
    );
  }
}

