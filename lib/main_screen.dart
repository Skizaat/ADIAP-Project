import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        //automaticallyImplyLeading: true
          elevation: 0.0,
          // for elevation
          titleSpacing: 0.0,
          // if you want remove title spacing with back button
          title: const Text('Nom Profil'),
          leading: Material( //Custom leading icon, such as back icon or other icon
              color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                ),
              )
          )
    );
  }
}