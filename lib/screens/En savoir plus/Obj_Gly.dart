import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Obj_Gly_Scaffold extends StatelessWidget {
  const Obj_Gly_Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = "Objectif glycémique pour débuter une activité physique\n\n";
    String _data = "L’activité physique fait le plus souvent baisser la glycémie, le niveau glycémique initial est donc déterminant. Il est préférable et conseillé de commencer l’effort avec une glycémie suffisamment haute.\n\nAfin d’anticiper la probable chute de la glycémie, qui peut être d’environ 70mg/dL dans les 30 minutes suivant le début de l’activité physique (en fonction de son intensité), il faut, idéalement, essayer de débuter votre activité physique avec une glycémie supérieure à 170 mg/dL.\n\nLa tendance doit être stable ou à la hausse.\n\nSi la glycémie est inférieure à 170 mg/dL ou que la tendance est à la baisse, prenez une collation avant de démarrer l’activité physique, comme vous le conseillera l’application.\n\nTout comme l’adaptation des doses d’insuline, cet objectif glycémique évoluera en fonction de votre expérience et de la réaction de votre corps à l’activité physique.";
    // of paper on which the UI appears.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plus d\'infos'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                child: Column(
                  children: [
                    Text(_title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                        child: Text(_data,
                            style: const TextStyle(fontSize: 15)
                        )
                    ),

                  ],
                )
            )
        )
    );
  }

}