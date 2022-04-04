import 'package:adiap/Classes/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:adiap/routes.dart';
import 'package:adiap/ActivityDatabase.dart';



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
        body: Column(
          children: [
            const Expanded(
                child: Center(
                  child: Text("Mes Activités à venir")
                )
            ),
            const Expanded(
                child: Center(
                  child: Text("Pas d'activités à venir pour l'instant"),
                )
            ),
            ElevatedButton(
                child: const Text("Créez une activité"),
                onPressed: () {
                  Activity tennis = const Activity(idActivity: 2, nameActivity: "tennis", intensity: "légère", day: "jeudi", hour: 15);
                  SQLiteDbProvider.db.insert(tennis);
                  SQLiteDbProvider.db.getAllActivities();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityRoute()));
                },

            )
          ],
        )
      ),
    );
  }
}