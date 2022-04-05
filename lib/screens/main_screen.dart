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
        body: Flex(
          direction: Axis.vertical,
            children: [
              Expanded(
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
                  ))),
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