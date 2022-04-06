import 'package:adiap/ActivityDatabase.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';

class OneActivityScaffold extends StatelessWidget {
  final Activity currentActivity;

  const OneActivityScaffold({Key, key, required this.currentActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool Start = false;
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Container(
      margin: EdgeInsets.all(20),
      height: 100,
      width: 200,
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
                    //OneActivityStart();
                  },
                ),
              ),
            ),
          ]
      ),
    );
  }
}

/*class OneActivityStart extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Text("yo");
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}*/