import 'package:adiap/Classes/User.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Databases/file_handler.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold (
      body: Flex (
        direction: Axis.vertical,
        children: [
          SizedBox(
            height: 200,
            child: Center(
              child: Icon(Icons.account_circle, size: 140)
            ),
          ),
          Expanded(
              child: displayProfileWidget(context))

        ],
      ),
    );
  }

  Widget displayProfileWidget(BuildContext context) {
    return Scaffold(
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
                return const Center(
                    child: Text("Error",
                      style: TextStyle(fontSize: 18),)
                );
              } else {
                return Scaffold(
                  body: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context,
                          int index) {
                        String name = data[index].name;
                        int weight = data[index].weight;
                        String treatment = data[index].diabTreatment;
                        return SingleChildScrollView(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                              ),
                              child: Column(
                                children: [
                                  Text("Compte de $name"),
                                  Text(
                                      "Poids: $weight"),
                                  Text('Type de traitement: $treatment'),
                                ],
                              )
                          ),
                        );
                      }
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