import 'package:adiap/Classes/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:adiap/routes.dart';
import 'package:adiap/Databases/ActivityDatabase.dart';



class MainScaffold extends StatelessWidget {
  MainScaffold({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Nom Profil'),
          leading: IconButton( //Custom leading icon, such as back icon or other icon
              onPressed: () {
                if(_drawerscaffoldkey.currentState!.isDrawerOpen) {
                  Navigator.pop(context);
                } else {
                  _drawerscaffoldkey.currentState!.openDrawer();
                }
              },
              icon: const Icon(Icons.menu),
          )
      ),


      body: Scaffold(
        key: _drawerscaffoldkey,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget> [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileRoute()));
                      },
                      child: Row(
                          children: const [
                            Icon(Icons.account_circle),
                            Text("Mon Profil")
                          ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityRoute()));
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.emoji_events),
                          Text("Mes Activités")
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const KnowledgeRoute()));
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.info),
                          Text("En savoir plus"),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ParameterRoute()));
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.settings),
                          Text("Paramètres"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

        ),
        body: Flex(
          direction: Axis.vertical,
            children: [
              const Expanded(
                  child: Center(
                    child: Text("Mes Activités")
                  )
              ),
              Expanded(
                child: SizedBox (
                  width: 300,
                  height: 100,
                  child: FutureBuilder(
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('${snapshot.error} occured',
                            style: TextStyle(fontSize: 18),
                            ),
                          );
                        } else if (snapshot.hasData) {
                            final data = snapshot.data as List<Activity>;
                            if (data.isEmpty) {
                              return const Center(
                                child: Text("Vous n'avez pas d'activité d'enregistrée"),
                              );
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
                  ))),
              ElevatedButton(
                  child: const Text("Créez une activité"),
                  onPressed: () async {
                    //Activity Tennis = new Activity(idActivity: 2, nameActivity: "Tennis", intensity: "Légère", day: "Mardi", hour: 14);
                    Activity Folie = new Activity(idActivity: 3, nameActivity: "FolieModéréee", intensity: "Modérée", day: "Mercredi", hour: 1);
                    //SQLiteDbProvider.db.insert(Tennis);
                    await SQLiteDbProvider.db.insert(Folie);
                     await Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityRoute()));
                  },
              ),
            ],
          )
      ),
    );
  }
}