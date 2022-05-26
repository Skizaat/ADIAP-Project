import 'Classes/activity.dart';
import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/Classes/User.dart';



String Newgiveproposition(User user, OneActivity oneActivity, Activity activity) {
  String proposition = "";
  print("Gonna start thinking about a proposition");

  if (oneActivity.actglycemie < oneActivity.aimglycemie){
    print("Il y a besoin d'un resucrage");
    proposition += NewPropositionResucrage(oneActivity.aimglycemie, oneActivity.actglycemie, user.weight);
  }
  if (user.diabTreatment == "Pompe à insuline") {
    print("Je suis dans le cas Pompe à insuline");
    proposition += propositionPompe(activity.offset_time, activity.offset_pourc);

  }
  if (user.diabTreatment == "Multi injection d insulines") {
    print("Je suis dans le cas Multi injection");
    proposition += "pas encore coder les injections\n";
  }

  proposition += "\nSi votre activité physique dure plus d'une heure, pensez à prendre une collation de 15 à 20 g de glucides par heure\n";
  print("finishthinking");
  return proposition;
}

String propositionPompe(int offset_time, int offset_pourcentage) {
  print("time dans proposition");
  print(offset_time);
  print("pourc dans proposition");
  print(offset_pourcentage);
  int pourcentage = 50 + offset_pourcentage;
  int time = 60 + offset_time;
  String proposition = 'ADIAP vous propose de réduire votre débit de base de ';
  proposition += pourcentage.toString() + "% " + time.toString() + " minutes avant le début de votre activité sportive.\n";
  return proposition;
}


void adaptation(int before, int after, Activity activity) {
  if (before - after > 15 ) {
    activity.offset_pourc += 10;
    activity.offset_time += -15;
  }
  if (after - before > 15) {
    activity.offset_pourc += -10;
    activity.offset_time += 15;
  }
}


String NewPropositionResucrage(int aiming, int actual, int weight) {
  print("je suis dans la focntion resucrage");
  print(aiming);
  print(actual);
  print(weight);
  String proposition = "";
  proposition += "ADIAP vous suggère de vous resucrez avant le début de votre activité physique pour atteindre la glycémie visée\n";
  int a_combler = aiming - actual;
  print("a combler $a_combler");
  int pour_combler_g;
  int val_10g;
  if ( weight <= 40 ) {
    val_10g = 75;
  }
  if ( 40 < weight && weight <= 50 ) {
    print("here");
    val_10g = 50;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  if ( 50 < weight && weight <= 60 ) {
    print("here");
    val_10g = 45;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  if ( 60 < weight && weight <= 70 ) {
    print("here");
    val_10g = 40;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    print(pour_combler_g);
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  if ( 70 < weight && weight <= 80 ) {
    print("here");
    val_10g = 35;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  if ( 80 < weight && weight <= 90 ) {
    print("here");
    val_10g = 30;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  if ( 90 < weight && weight <= 100 ) {
    print("here");
    val_10g = 25;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  if ( 100 < weight && weight <= 110 ) {
    print("here");
    val_10g = 20;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  if ( 100 < weight) {
    print("here");
    val_10g = 15;
    pour_combler_g = ((a_combler*10)/val_10g).ceil();
    proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
  }
  //else {
  //proposition += "Il y a eu un problème (resucrage)";
  //}
  return proposition + "\n";
}