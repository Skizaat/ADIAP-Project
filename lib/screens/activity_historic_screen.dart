import 'package:adiap/Databases/OneActivityDatabase.dart';
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
      appBar: AppBar(
        title: const Text('Créer une activité'),
      ),
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
                        return SingleChildScrollView(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => SeanceRoute(oneActivity: data[index])));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    border: Border.all(
                                        color: Colors.black, width: 1)
                                ),
                                child: Text("Séance du $date"),

                            ),
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