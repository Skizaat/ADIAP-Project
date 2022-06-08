import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Adat_insu_Scaffold extends StatelessWidget {
  const Adat_insu_Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = "Adaptations des doses d’insulines à votre activité physique\n\n";
    String _data = "En général, l’activité physique fait baisser la glycémie et remplace une partie de votre insuline ; il va donc falloir que vous baissiez vos doses pour éviter les hypoglycémies.\n\nLe but de cette adaptation est de se rapprocher le plus possible de la physiologie du corps lors d’une activité physique en réduisant par anticipation l’insuline active avant le démarrage de l’activité physique.\nCe sont des décisions complexes à prendre au départ mais qui par la suite se simplifie lorsque vous connaissez la réaction de votre corps à l’activité physique.\n\nUn certain nombre d’éléments devront être pris en compte pour ajuster les doses d’insuline : le délai de l’activité physique par rapport au repas, sa durée, le type d’activité et l’intensité à laquelle elle est pratiquée. Le type de traitement par insuline est aussi un élément majeur à prendre en compte : la conduite à tenir sera différente si vous avez une pompe à insuline ou si vous êtes sous stylos à insuline.\n\nEn pratique, comment faire ?\n\nIl faut anticiper votre activité physique pour agir sur les doses d’insuline.\n\nVotre activité n’aura pas le même effet sur vos glycémies selon son intensité et sa durée.\n\nLes activités d’intensité faibles ou modérées sont plutôt hypoglycémiantes et les activités physiques de forte intensité ou d’intensité explosive sont plutôt hyperglycémiantes. Cette information sera importante pour définir votre adaptation des doses d’insuline et elles pourront vous donner des indications sur la période la plus à risque de faire des hypoglycémies.\n\nSi l’activité est longue (supérieure à 1h), il sera peut-être nécessaire de prendre une collation quelle que soit votre glycémie pour la maintenir stable.\n\n\nSi l’activité physique est proche du repas (moins de 3 h avant ou après), il faudra diminuer votre dose d’insuline rapide/bolus du repas précédent et/ou suivant l’activité.\n\nSi l’activité physique est à distance d’un repas (+ de 3 h avant ou après), il sera nécessaire d’agir sur l’insuline basale.\n\nCette action n’est possible que pour un traitement par pompe à insuline. Nous vous conseillons de programmer un débit de base temporaire un peu avant votre activité, le temps de l’activité et un peu après votre activité physique le temps que vos muscles refassent leurs stocks en glycogène.\n\nIl n’y a pas nécessité de réduire votre dose d’insuline basale si vous êtes sous stylos à insuline sauf dans le cas d’activités de fortes intensités, qui risquent d’induire des hypoglycémies à distance de votre pratique sportive, ou pour des activités plus prolongées qu’à l’ordinaire, surtout si elles se répètent d’un jour à l’autre (ex : semaine au ski, randonnées sur plusieurs jours…).\n\nSi vous ne pouvez pas modifier votre dose d’insuline basale ou si vous n’avez pas pu anticiper votre activité physique, il vous faudra, le cas échéant prendre une collation préventive pour viser une glycémie de départ plus haute (> 170 mg/dL).\n\nPlus vous observerez votre glycémie mieux vous apprendrez comment réagit votre corps et trouverez les doses adaptées à vos activités. L’application sera là pour vous aider à trouver quelles adaptations de votre dose d’insuline vous conviendront le mieux.";
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