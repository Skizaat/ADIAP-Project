import 'package:adiap/Classes/Proposition.dart';
import 'package:adiap/Databases/OneActivityDatabase.dart';
import 'package:adiap/Databases/PropositionDatabase.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/routes.dart';



import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/Classes/activity.dart';

class SeanceScaffold extends StatelessWidget {
  final OneActivity oneActivity;
  const SeanceScaffold({Key, key, required this.oneActivity});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        //height: 100,
        //width: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1)
        ),
        child: Column(
            children: [
              Text("Séance du " + oneActivity.date + "\n\n", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Flex(
                direction: Axis.vertical,
                children: [
                  Text("Glycémie visée: " + oneActivity.aimglycemie.toString() + " mg/dL\n"),
                  Text("Glycémie " + oneActivity.timebefore.toString() + " h avant le début de l'activité: " + oneActivity.actglycemie.toString() + "mg/dL\n\n"),
                  Container(
                    height: 500,
                    alignment: Alignment.bottomLeft,
                    child: FutureBuilder(
                        builder: (ctx, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('${snapshot.error} occured',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              );
                            } else if (snapshot.hasData) {
                              final proposition = snapshot.data as Proposition;
                              return Scaffold(
                                body: Text(
                                    "Voici ce que vous a proposé ADIAP: \n\n" +
                                        proposition.proposition),

                              );
                            }
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        future: PropSQLiteDbProvider.db.getById(oneActivity.idOne),
                    ),
                  ),
                  Text("retour"),
                ],
              ),
            ]
        ),
      ),
    );
  }
}