import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Act_Phy_Int_Scaffold extends StatelessWidget {
  const Act_Phy_Int_Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = "Activité physique et intensité : quésaco ?\n\n";
    String _data = "L’intensité correspond à l’énergie dépensée ou l’ampleur de l’effort investi pour réaliser une activité ou un exercice. On distingue : \n\nles activités de faible intensité : marche lente (4 km/h), ménage, entretien mécanique, pétanque, billard, bowling, Frisbee, voile, golf, volley-ball, tennis de table (en dehors de la compétition)… ;\n\nles activités d’intensité modérée : marche rapide (6 km/h), jardinage léger, ramassage de feuilles, port de charges de quelques kilos, danse de salon modérée, vélo, natation « plaisir », aquagym, ski alpin… ;\n\nles activités d’intensité élevée : marche en côte, randonnée en moyenne montagne bêchage, déménagement, jogging (10 km/h), VTT, natation « rapide », saut à la corde, football, basketball, sports de combat, tennis (en simple), squash…\n\n\nCes différentes intensités peuvent se mesurer d’après votre fréquence cardiaque, votre perception de l’effort (échelle de 1 à 10), votre fréquence respiratoire ou encore votre capacité à parler. Chez l’adulte, il est recommandé de débuter par des activités d’intensité modérée. Avec accord de votre équipe médicale, vous pourrez ensuite viser des intensités modérées à élevées sur une durée de 30 minutes, au moins 5 jours par semaine, recommandées par l’OMS.\nLors d’activités d’intensité faible à modérée, on peut observer une glycémie qui baisse et un risque d’hypoglycémie. A l’inverse, lors d’activités à intensité élevée, la glycémie peut transitoirement monter sous l’effet de l’adrénaline, favorisant des hyperglycémies.";
    // Material is a conceptual piece
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