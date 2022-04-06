import 'package:adiap/ActivityDatabase.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:flutter/services.dart';
import 'package:adiap/routes.dart';
import 'package:adiap/create_perso.dart';


class StartActivityScaffold extends StatelessWidget {
  final Activity startingActivity;

  const StartActivityScaffold({Key, key, required this.startingActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
        body: Column(
              children: [
                Text(startingActivity.getNameActivity(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Text(startingActivity.getDay(), style: const TextStyle(fontSize: 18),),
                Text(startingActivity.getHour().toString() + ' h', style: const TextStyle(fontSize: 18),),
                Container(
                  height: 150,
                  width: 300,
                  alignment: Alignment.bottomCenter,
                  child: Text("Veuillez renseigner les informations suivantes pour qu'ADIAP vous conseille dans l'adaptation de l'insuline", style: TextStyle(fontSize: 19),),
                ),
                const StartingForm(),
              ]
        ),
    );

  }
}

class StartingForm extends StatefulWidget {
  const StartingForm({Key? key}) : super(key: key);

  @override
  StartingFormState createState() {
    return StartingFormState();
  }
}

class StartingFormState extends State<StartingForm> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController aimController = TextEditingController();
  TextEditingController glycemieController = TextEditingController();
  TextEditingController beforeActController = TextEditingController();
  TextEditingController mealController = TextEditingController();


  @override
  Widget build(BuildContext context){
    int? aiming;
    return Form(
        key: _formKey,
          child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
                Text("Entrez la valeur de Glycémie que vous souhaitez atteindre au début de votre séance de sport (par défaut la valeur est de 170 UNITE"),
                TextFormField(
                  controller: aimController,
                onSaved: (value){aiming=value as int;},
                decoration: const InputDecoration(labelText: "Glycémie visée"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                validator: (value) {
                  return null;
                },
              ),
            TextFormField(
              controller: glycemieController,
              onSaved: (value){aiming=value as int;},
              decoration: const InputDecoration(labelText: "Rentrez  votre glycémie actuelle"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'rentrez les informations';
                }
                return null;
              },
            ),
            Text("Dans combien d'heures commencez vous votre activité physique ?"),
            TextFormField(
              controller: beforeActController,
              onSaved: (value){aiming=value as int;},
              decoration: const InputDecoration(labelText: "Heures avant l'activité"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'rentrez les informations';
                }
                return null;
              },
            ),
            Text("Combien d'heures séparent votre activité physique et votre repas le plus proche ?"),
            TextFormField(
              controller: mealController,
              onSaved: (value){aiming=value as int;},
              decoration: const InputDecoration(labelText: "Repas le plus proche"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'rentrez les informations';
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print(aimController.text);
                  print(glycemieController.text);
                  print(beforeActController.text);
                  print(mealController.text);
                },
                child: Text('Valider')
            )
          ],
        )
    );
  }
}