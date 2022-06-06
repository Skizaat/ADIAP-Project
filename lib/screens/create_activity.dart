import 'dart:io';

import 'package:adiap/routes.dart';
import 'package:flutter/material.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'notif.dart';
import 'package:adiap/Databases/ActivityDatabase.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../theme/custom_theme.dart';

class CreateActivityScaffold extends StatelessWidget {

  const CreateActivityScaffold({Key, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Créer une activité'),
        ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
          child: const CreateForm() //Text
        ), //Container
      ),
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

  void createNotif(int hour, String day){
    FlutterLocalNotificationsPlugin fltrExtNotification;
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    fltrExtNotification = new FlutterLocalNotificationsPlugin();
    fltrExtNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.local);
    //tz.TZDateTime schedTime = _setupDayTime();
    var androidDetails = AndroidNotificationDetails("Channel ID", "Desi programmer", importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iSODetails);
    //var scheduledTime = tz.TZDateTime.from(DateTime.now().add(const Duration(seconds : 10)), tz.local);
    fltrExtNotification.zonedSchedule(1, "Votre séance de sport est dans une heure!", "ADIAP : adaptez insuline", setupDayTime(hour, day), generalNotificationDetails, androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation:
    UILocalNotificationDateInterpretation.absoluteTime,matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }

  void notificationSelected(String? payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Notification : $payload"),
      ),
    );
  }

  tz.TZDateTime setupDayTime(int hour, String day) {
    int daynb=0;
    switch(day){
      case "Lundi":
        daynb=1;
        break;
      case "Mardi":
        daynb=2;
        break;

      case "Mercredi":
        daynb=3;
        break;

      case "Jeudi":
        daynb=4;
        break;

      case "Vendredi":
        daynb=5;
        break;
      case "Samedi":
        daynb=6;
        break;

      case "Dimanche":
        daynb=7;
        break;
      default:
        daynb=1;
        break;
    }
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    //print("nous sommes le " + now.weekday.toString() + "eme jour de la semaine");
    print("scheduled at : ");
    print(now.day+daynb-now.weekday);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day+daynb-now.weekday, hour-2-2, 30); //il faut retirer 2h à l'heure actuelle onn prévient une heure et demie avant

    print("it is " + now.year.toString() + " " + now.month.toString() + " " + now.day.toString() + " " + now.hour.toString() + " (set time : 14) ");
    return scheduledDate;
  }




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
              textAlign: TextAlign.center,
              controller: activiteController,
              decoration: const InputDecoration(
                labelText: "Nom de l'activite",
                contentPadding: EdgeInsets.all(5),
              ),
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
          style: const TextStyle(color: Color(0xff1665a0)),
          underline: Container(
            height: 2,
            color: Color(0xff1665a0),
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
          style: const TextStyle(color: Color(0xff1665a0)),
          underline: Container(
            height: 2,
            color: Color(0xff1665a0),
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
          textAlign: TextAlign.center,
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
                createNotif(int.parse(timeController.text), weekday);
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