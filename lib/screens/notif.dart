
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notifications",
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  late FlutterLocalNotificationsPlugin fltrNotification;

  @override
  void initState(){
    super.initState();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.local);
    //tz.TZDateTime schedTime = _setupDayTime();
    var androidDetails = AndroidNotificationDetails("Channel ID", "Desi programmer", importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iSODetails);
    //var scheduledTime = tz.TZDateTime.from(DateTime.now().add(const Duration(seconds : 10)), tz.local);
    fltrNotification.zonedSchedule(1, "this is a notif", "Task", _setupDayTime(), generalNotificationDetails, androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation:
    UILocalNotificationDateInterpretation.absoluteTime,matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);

    /*const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'repeating channel id', 'repeating channel name',
        channelDescription: 'repeating description');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await fltrNotification.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
        androidAllowWhileIdle: true);*/
  }

  tz.TZDateTime _setupDayTime() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, 14, 0); //il faut retirer 2h à l'heure actuelle
    print("it is " + now.year.toString() + " " + now.month.toString() + " " + now.day.toString() + " " + now.hour.toString() + " (set time : 14) ");
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: _showNotification, child: Text("FlutterNotification")),
      )
    );
  }

  void notificationSelected(String? payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Notification : $payload"),
      ),
    );
  }

}
