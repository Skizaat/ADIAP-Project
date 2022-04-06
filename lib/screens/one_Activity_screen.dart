import 'package:adiap/ActivityDatabase.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:adiap/routes.dart';
import 'package:adiap/OneActivityDatabase.dart';

class OneActivityScaffold extends StatelessWidget {
  final Activity currentActivity;

  const OneActivityScaffold({Key, key, required this.currentActivity,}) : super(key: key);

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
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1)
          ),
          child: Column(
              children: [
                Text(currentActivity.getNameActivity(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Text(currentActivity.getDay(), style: const TextStyle(fontSize: 18),),
                Text(currentActivity.getHour().toString() + ' h', style: const TextStyle(fontSize: 18),),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: ElevatedButton(
                          child: Text('Editer'),
                          onPressed: () {
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: ElevatedButton(
                          child: Text('Historique'),
                          onPressed: () {
                            OneSQLiteDbProvider.db.getbyIdAssociatedActivity(currentActivity.idActivity);
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricActivityRoute(concernedActivity: currentActivity)));
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: ElevatedButton(
                          child: Text('Supprimer'),
                          onPressed: () {
                            SQLiteDbProvider.db.delete(currentActivity.getId());
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainRoute()));
                          },
                        ),
                      ),
                    ),

                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: ElevatedButton(
                      child: Text('Pratiquer cette activité'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StartActivityRoute(startingActivity: currentActivity)));
                      },
                    ),
                  ),
                ),
              ]
          ),
        ),
    );
  }
}
