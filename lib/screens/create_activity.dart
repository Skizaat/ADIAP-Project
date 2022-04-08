import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:weekday_selector/weekday_selector.dart';

class CreateActivityScaffold extends StatelessWidget {
  final Activity createActivity;

  const CreateActivityScaffold({Key, key, required this.createActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreateForm(createActivity: createActivity),
    );
  }
}

class CreateForm extends StatefulWidget {
  final Activity createActivity;
  const CreateForm({Key? key, required this.createActivity}) : super(key: key);

  @override
  CreateFormState createState() {
    return CreateFormState(createActivity: createActivity);
  }
}

class CreateFormState extends State<CreateForm> {
  final Activity createActivity;
  CreateFormState({Key? key, required this.createActivity});

  final _formKey = GlobalKey<FormState>();
  TextEditingController activiteController = TextEditingController();
  TextEditingController intensite = TextEditingController();
  TextEditingController timeController = TextEditingController();
  List<bool> values = List.filled(7, false);

  @override
  Widget build(BuildContext context){
    String? typeActivite;
    String actIntensite = "légère";
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
        items: <String>['légère','modérée','intense']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),

      WeekdaySelector(
        onChanged: (int day) {
          setState(() {
            // Set all values to false except the "day"th element
            values = List.filled(7, false, growable: false)..[day % 7] = true;
          });
        },
        values: values,
      );
      TextFormField(
      controller: timeController,
      onSaved: (value) {
        weight = value as int;
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
    String dayname;
    List<String> weekdays=["Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"];
    dayname=weekdays[day-1];
    Activity newActivity = Activity(idActivity: 1,
    nameActivity: activiteController.text,
    intensite: actIntensite,
    day:dayname,
    hour: int.parse(timeController.text),
    await OneSQLiteDbProvider.db.insert(newActivity);
    final user = await UserSQLiteDbProvider.db.getAllOnes();
    Navigator.push(context, MaterialPageRoute(builder: (context) => PropositionRoute(activity: createActivity,activity: newActivity, user: user[0],)));
    )
    },
    child: Text('Voir ce que vous propose ADIAP')
    }
        ],
      )
    );
  }
}