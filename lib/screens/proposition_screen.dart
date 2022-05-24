
import 'package:adiap/Classes/Proposition.dart';
import 'package:adiap/Databases/PropositionDatabase.dart';
//import 'package:adiap/proposition_functions.dart';
import 'package:adiap/new_propositions.dart';
import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/Classes/User.dart';
import 'package:flutter/material.dart';
import 'package:adiap/routes.dart';

import '../Classes/activity.dart';

class PropositionScaffold extends StatelessWidget {
  final Activity activity;
  final OneActivity oneActivity;
  final User user;

  const PropositionScaffold({Key, key, required this.activity, required this.oneActivity, required this.user});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Propositions'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
        height: 500,
        child: Column(
          //direction: Axis.vertical,
          children: [
            Text(Newgiveproposition(user, oneActivity, activity)),
            ElevatedButton(
                child: const Text("J'ai pris connaissance des propositions d'ADIAP"),
                onPressed: () async {
                  Proposition proposition = Proposition(idProposition: 1, idOneActivity: oneActivity.idOne, proposition: Newgiveproposition(user, oneActivity, activity));
                  await PropSQLiteDbProvider.db.insert(proposition);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OneActivityRoute(currentActivity: activity,)));
                }
            ),
            Text("Toutes les propositions d'ADIAP sont retrouvables dans l'historique de l'activité, dans la séance correspondante"),
          ],
        ),
      ),
    );
  }
}