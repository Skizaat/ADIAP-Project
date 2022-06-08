import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Col_res_Scaffold extends StatelessWidget {
  const Col_res_Scaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = "Collation préventive et resucrage durant une activité physique\n\n";
    String _data = "Un resucrage est un apport de glucides rapides ou simples [index glycémique (IG) >70%] avalés pour corriger une hypoglycémie. Chez l’adulte, il est conseillé 5 g de glucides par 20 kg de masse corporelle (15 à 20 g par resucrage, en moyenne). La collation est aussi un apport de glucides d’environ 15 g composée de sucres moyennement rapides voire lents (IG<50%) ; elle est utilisée entre les repas ou lors d’activités physiques longues.\n\nL’activité physique étant souvent la cause d’hypoglycémies, nous vous conseillons de débuter avec une glycémie supérieure à 170mg/dL. Si votre glycémie est inférieure à ce seuil avant de débuter l’activité, vous pouvez absorber une collation.\n\nDurant un effort de moins d’1h30, l’apport régulier de glucides rapides est conseillé, même si vous n’avez pas faim. Un apport entre 15 et 40 g de glucides rapides par heure est recommandé et n’hésitez pas à noter vos apports pour connaitre précisément vos besoins.\n\nDes collations pourront être absorbées, en plus des sucres rapides, lors d’activités longues (randonnée, efforts répétés) ou pour éviter les hypoglycémies après l’effort, lorsque vos réserves se reconstituent.\n\nParmi les resucrages habituels, citons 3 morceaux de sucre blanc ou 15 cl de jus de fruit ou soda, ou 1 cuillère à soupe de confiture ou miel, ou 5 à 6 bonbons.\n\nPour les collations, on limite les aliments n’apportant que des glucides (fruits, compotes, pain blanc, biscottes, biscuits du commerce, certaines barres de céréales…) sans protéines ni bonnes graisses. On privilégie les fruits moyennement hyperglycémiants et on évite bananes, prunes, cerises, raisins, fruits exotiques et fruits au sirop. Sont conseillés oranges, 2 kiwis, mandarines, clémentines, nectarines, pêches, pommes, poires, ½ pamplemousse, 250 g de fraises, 200 g de melon ou pastèque, 125 g d’ananas ou de fruits en boîte au jus (sans sucre ajouté), 3 prunes ou abricots et 1 verre de jus de tomates ou de légumes.";    // of paper on which the UI appears.
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