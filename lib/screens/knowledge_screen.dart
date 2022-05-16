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
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Text('Activité physique et diabète'),
                ),
              GestureDetector(
                onTap: () {},
                child: Text('Adaptations des doses d’insulines pour l’activité physique'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Physiologie du corps à l’activité physique', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Alimentation et sport'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Collation préventive et resucrage durant une activité physique'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Activité physique et hypoglycémie'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Activité physique et hyperglycémie'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Objectif glycémique pour débuter une activité physique'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Activité physique et intensité : quesaco ?'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Surveillance glycémique lors de mon activité physique'),
              ),
            ],
          ),
        ), //Container
      ),
    );
  }
}