import 'dart:io';

import 'package:adiap/Classes/Retours.dart';
import 'package:adiap/Databases/ActivityDatabase.dart';
import 'package:adiap/Classes/User.dart';
import 'package:adiap/Databases/file_handler.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:flutter/services.dart';
import 'package:adiap/routes.dart';
import 'package:adiap/create_perso.dart';
import 'package:adiap/Databases/OneActivityDatabase.dart';
import 'package:adiap/Classes/OneActivity.dart';
import 'package:intl/intl.dart';

import '../Databases/RetourDatabase.dart';


class RetourScaffold extends StatelessWidget {
  final OneActivity oneActivity;

  const RetourScaffold({Key, key, required this.oneActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
          children: [
            Text("Séance du " + oneActivity.date, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Container(
              height: 150,
              width: 300,
              alignment: Alignment.bottomCenter,
              child: Text("Veuillez renseigner les informations suivantes\n", style: TextStyle(fontSize: 19),),
            ),
            RetourForm(oneActivity: oneActivity),
          ]
      ),
    );

  }
}

class RetourForm extends StatefulWidget {
  final OneActivity oneActivity;
  const RetourForm({Key? key, required this.oneActivity}) : super(key: key);

  @override
  RetourFormState createState() {
    return RetourFormState(oneActivity: oneActivity);
  }
}

class RetourFormState extends State<RetourForm> {
  final OneActivity oneActivity;
  RetourFormState({Key? key, required this.oneActivity});

  final _formKey = GlobalKey<FormState>();
  TextEditingController stateController = TextEditingController();
  TextEditingController commentaryController = TextEditingController();



  @override
  Widget build(BuildContext context){
    int? aiming;
    return Form(
        key: _formKey,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text("Entrez l'état de votre glycémie à la fin de la séance"),
            TextFormField(
              controller: stateController,
              decoration: const InputDecoration(labelText: "Par exemple: Hypoglycémie"),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Entrez l'état de votre glycémie";
                }
                return null;
              },
            ),
            Text("Entrez un commentaire sur cette séance"),
            TextFormField(
              controller: commentaryController,
              decoration: const InputDecoration(labelText: "Par exemple: J'ai pris une banane avant de commencer ma séance mais ça n'a pas suffit, j'ai fini en hypo. Penser à prendre plus de glucide la prochaine fois"),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Entrez un commentaire, même si c'est un simple 'pas de commentaire'";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Retour newRetour = Retour(idRetour: 1, idOneActivity: oneActivity.idOne, stateGly: stateController.text, commentary: commentaryController.text);
                    await RetourSQLiteDbProvider.db.insert(newRetour);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SeanceRoute(oneActivity: oneActivity)));
                  }
                },
                child: Text('Enregistrer mon retour"')
            )
          ],
        )
    );
  }
}