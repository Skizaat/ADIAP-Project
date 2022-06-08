import 'package:flutter/material.dart';
import 'package:adiap/routes.dart';

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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Act_Phy_Diab_Route()));
                },
                child: Text('Activité physique et diabète\n'),
                ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Adat_insu_Route()));
                },
                child: Text('Adaptations des doses d’insulines pour l’activité physique\n'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Physiologie du corps à l’activité physique\n', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Alimentation et sport\n', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
              GestureDetector(
                onTap: () {Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Col_res_Route()));},
                child: Text('Collation préventive et resucrage durant une activité physique\n'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Activité physique et hypoglycémie\n', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Activité physique et hyperglycémie\n', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Obj_Gly_Route()));
                },
                child: Text('Objectif glycémique pour débuter une activité physique\n'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Act_Phy_Int_Route()));
                },
                child: Text('Activité physique et intensité : quesaco ?\n'),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Surveillance glycémique lors de mon activité physique\n', style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ],
          ),
        ), //Container
      ),
    );
  }
}