import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:adiap/routes.dart';


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
                    Row(
                      children: const [
                        Icon(Icons.account_circle),
                        Text("Mon Profil")
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityRoute()));
                      },
                      child: Container(
                        child: Row(
                          children: const [
                            Icon(Icons.emoji_events),
                            Text("Mes Activités")
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.info),
                        Text("En savoir plus"),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.settings),
                        Text("Paramètres"),
                      ],
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityRoute()));
                },

            )
          ],
        )
      ),
    );
  }
}