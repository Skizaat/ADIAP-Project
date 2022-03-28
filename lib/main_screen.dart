import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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
                    Row(
                      children: const [
                        Icon(Icons.emoji_events),
                        Text("Mes Activités")
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.help_outline),
                        Text("En savoir plus"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.settings),
                        Text("Paramètres"),
                      ],
                    ),
                  ],
                ),
              ),
              /*child: Container(
              color: Colors.white60,
              height: MediaQuery.of(context).size.height
              ),*/

            ),
          )

        ),
      ),
    );
  }
}