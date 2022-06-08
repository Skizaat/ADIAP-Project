import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Act_Phy_Diab_Scaffold extends StatelessWidget {
  const Act_Phy_Diab_Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = "Activité physique et diabète\n\n";
    String _data = "L’activité physique est bénéfique pour la santé, que ce soit chez une personne vivant avec un diabète ou pour la population générale. Souvent associée au risque hypoglycémique ou à des variations glycémiques importantes, ces effets bénéfiques sont souvent mis sur le côté. En tête de liste, on y trouve l’amélioration de la sensibilité de vos cellules à l’insuline et, si l’exercice physique est régulier, cela peut devenir salutaire. En effet, le muscle étant un grand consommateur de glucose (même au repos), ceci peut contribuer à améliorer le contrôle glycémique à long terme.\n\nA cet avantage, nous pouvons y ajouter la diminution des facteurs de risque cardiovasculaire, ainsi qu’une amélioration de la condition physique et du bien être d’une manière générale.\n\nLe diabète ne doit pas être un frein à la pratique sportive !\n\nMais adapter son traitement et son alimentation est nécessaire afin de prévenir la survenue d’hypoglycémie.\n\nLa diététique doit être appropriée, comme pour tout sportif, que l’on ait un diabète ou non, afin de permettre l’effort, avant, pendant et après. Elle permet également de prévenir les hypoglycémies et/ou de les corriger.\n\nUne adaptation de vos doses d’insulines est également nécessaire avant l’effort, pendant et même après.\n\nUne connaissance de vos glycémies en temps réel, que permettent les capteurs de glucose, vous apporte des informations sur les variations glycémiques, ce qui donne lieu à une gestion plus fine des doses d’insuline et de l’alimentation.\n\nEt, surtout, votre expérience personnelle vous permettra de trouver la stratégie la plus adaptée et qui vous convient pour profiter de votre activité sans que le diabète ne soit un frein.";    // Material is a conceptual piece
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