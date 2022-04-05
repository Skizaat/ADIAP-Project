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
    return FutureBuilder(
      builder: (ctx, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              '${snapshot.error} occured',
              style: TextStyle(fontSize: 18),
            ),
          );
        } else if (snapshot.hasData) {
          final data = snapshot.data as List<Activity>;
          String name = data[1].getNameActivity();
          String day = data[1].getDay();
          int hour = data[1].getHour();
          return Scaffold(
            body: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OneActivityRoute()));
              },
              child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        leading: Icon(Icons.emoji_events),
                        title: Text("$name"),
                        trailing: Text("le $day à $hour h"),
                    );
                  }
              ),
            ),
          );
        }
      }
          return const Center(
            child: CircularProgressIndicator(),
                );
        },
      future: SQLiteDbProvider.db.getAllActivities(),
    );
  }
}


