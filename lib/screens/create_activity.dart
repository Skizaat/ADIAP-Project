import 'dart:io';

import 'package:adiap/routes.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:flutter/services.dart';

import 'package:adiap/Databases/ActivityDatabase.dart';

class CreateActivityScaffold extends StatelessWidget {

  const CreateActivityScaffold({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateForm(),
    );
  }
}

class CreateForm extends StatefulWidget {
  const CreateForm({Key? key}) : super(key: key);

  @override
  CreateFormState createState() {
    return CreateFormState();
  }
}

class CreateFormState extends State<CreateForm> {
  CreateFormState({Key? key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController activiteController = TextEditingController();
  TextEditingController intensite = TextEditingController();
  TextEditingController timeController = TextEditingController();
  List<bool> values = List.filled(7, false);
  String actIntensite = "Légère";
  String weekday="Lundi";

  @override
  Widget build(BuildContext context){
    String? typeActivite;
    int? time;
    return Form(
      key: _formKey,
      child: Flex(

        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          TextFormField(
            controller: activiteController,
            decoration: const InputDecoration(labelText: "Nom de l'activite"),
            onSaved: (value) {
              typeActivite = value;
          },
        // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Entrez le nom de l'activite";
            }
            return null;
          },
      ),
      Text("Entrer l'intenstié de l'activité que vous faites"),
      DropdownButton<String>(
        value: actIntensite,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (String? newValue) {
          setState(() {
            actIntensite = newValue!;
          });
        },
        items: <String>['Légère','Modérée','Intense']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),

      DropdownButton<String>(
        value: weekday,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (String? newValue) {
          setState(() {
            weekday = newValue!;
          });
        },
        items: <String>["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      TextFormField(
        controller: timeController,
        onSaved: (value) {
          time = value as int;
        },
        decoration: const InputDecoration(labelText: "Heure"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        // Only numbers can be entered
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Entrez l'heure de l'activite (ex 16 pour 16h)";
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Activity newActivity = Activity(idActivity: 1,
              nameActivity: activiteController.text,
              intensity: actIntensite,
              day: weekday,
              hour: int.parse(timeController.text),);
            await SQLiteDbProvider.db.insert(newActivity);
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => OneActivityRoute(currentActivity: newActivity,)));
          }
        },
        child: Text('Enregistrer'),
      ),
    ],
    )
    );
  }
}