import 'package:adiap/OneActivityDatabase.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/routes.dart';

class HistoricActivityScaffold extends StatelessWidget {
  final Activity concernedActivity;

  const HistoricActivityScaffold({Key, key, required this.concernedActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: Text(concernedActivity.nameActivity, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
          ),
          Expanded(
                child: displayHistoricWidget(context, concernedActivity)),
          SupprButton(context, concernedActivity),
        ],
      ),
    );
  }

  Widget displayHistoricWidget(BuildContext context, Activity activity) {
    return Scaffold(
      body: FutureBuilder(
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error} occured',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data as List<OneActivity>;
                if (data.isEmpty) {
                  return const Center(
                      child: Text("Vous n'avez pas encore effectué d'enregistrements pour cette activité",
                        style: TextStyle(fontSize: 18),)
                  );
                } else {
                  return Scaffold(
                    body: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context,
                            int index) {
                          String date = data[index].getdate();
                          int startglycemie = data[index].getactglycemie();
                          int aimglycemie = data[index].getaimglycemie();
                          int timebefore = data[index].gettimebefore();
                          String propositionAdiap = 'proposition';
                          String endState = "Normal Glycémie";
                          String comment = "comment";
                          return SingleChildScrollView(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.all(
                                        color: Colors.black, width: 1)
                                ),
                                child: Column(
                                  children: [
                                    Text("Séance du $date"),
                                    Text(
                                        "Glycémie $timebefore h avant la séance: $startglycemie mg/dL"),
                                    Text(endState),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(propositionAdiap),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(comment),
                                    ),
                                  ],
                                )
                            ),
                          );
                        }
                    ),
                  );

                }
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        future: OneSQLiteDbProvider.db.getbyIdAssociatedActivity(activity.idActivity),
      ),
    );
  }

  Widget SupprButton(BuildContext context, Activity activity){
    return ElevatedButton(
      child: Text('Vider l historique'),
      onPressed: () {
        OneSQLiteDbProvider.db.deleteByActivityId(activity.idActivity);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainRoute()));
      },
    );
  }
}