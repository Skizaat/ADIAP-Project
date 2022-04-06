import 'package:flutter/material.dart';
import 'package:adiap/ActivityDatabase.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:path/path.dart';
import 'package:adiap/routes.dart';

class ActivityScaffold extends StatelessWidget {
  const ActivityScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return displayActivityWidget(context);
  }

  Widget displayActivityWidget(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: 300,
          height: 100,
          child: FutureBuilder(
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error} occured',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data as List<Activity>;
                  if (data.isEmpty) {
                    return const Center(
                        child: Text("Vous n'avez pas d'activité d'enregistrée",
                          style: TextStyle(fontSize: 18),));
                  } else {
                    return Scaffold(
                      body: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context,
                            int index) {
                          String name = data[index]
                              .getNameActivity();
                          String day = data[index].getDay();
                          int hour = data[index].getHour();
                          return SingleChildScrollView(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => OneActivityRoute(currentActivity: data[index])));
                                  },
                                  child: ListTile(
                                    leading: Icon(Icons.emoji_events),
                                    title: Text("$name"),
                                    trailing: Text("le $day à $hour h"),
                                  )
                              )
                          );
                        },
                      ),
                    );
                  }
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            future: SQLiteDbProvider.db.getAllActivities(),
          )
      ),
    );
  }
}