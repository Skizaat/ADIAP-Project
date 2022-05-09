import 'package:adiap/Classes/User.dart';
import 'package:flutter/material.dart';
import 'package:adiap/routes.dart';
import 'package:adiap/create_perso.dart';
import 'package:adiap/Databases/file_handler.dart';

class WelcomeScaffold extends StatelessWidget {
  const WelcomeScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
      return Scaffold(
        appBar: AppBar(
          title: const Text('ADIAP'),
        ),
        // Column is a vertical, linear layout.
          body: FutureBuilder(
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error} occured',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data as List<User>;
                  if (data.isEmpty) {
                    return Column(
                      children: [
                        const Expanded(
                            child: Center(
                                child: Text('Bienvenue dans ADIAP')
                            )
                        ),
                        ElevatedButton(
                            child: const Text('Créer mon profil'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const UserFormRoute()));
                              ;
                            }
                        ),
                      ],
                    );
                  } else {
                    String name = data[0].name;
                    return Scaffold(
                      body: Center(
                        child: Container(
                          height: 100,
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              Text("Bienvenue $name !"),
                              ElevatedButton(
                                  child: const Text('Rentrer dans l application'),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const MainRoute()));
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );

            },
            future: UserSQLiteDbProvider.db.getAllOnes(),
          ),
      );
  }
}


