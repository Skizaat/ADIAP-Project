import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/Classes/User.dart';
import 'package:flutter/material.dart';
import 'Classes/activity.dart';

/*String giveproposition(User user, OneActivity oneActivity, Activity activity) {
  String proposition = "";
  print("Gonna start thinking about a proposition");

  if (oneActivity.actglycemie < oneActivity.aimglycemie){
    print("Il y a besoin d'un resucrage");
    proposition += propositionResucrage(oneActivity.aimglycemie, oneActivity.actglycemie, user.weight);
  }
  if (user.diabTreatment == "Pompe à insuline") {
    print("Je suis dans le cas Pompe à insuline");
    print(oneActivity.timemeal);
    if (oneActivity.timemeal > 2) {
      print("je suis dans le cas loin d'un repas");
      proposition += pompeLoinRepas(activity.intensity);
    }
    if (oneActivity.timemeal <= 2) {
      print("je suis dans le cas proche d'un repas");
      proposition += pompeProcheRepas(activity.intensity);
    }
    //else {
      //proposition += "Il y a eu un problème (pompe)";
    //}
  }
  if (user.diabTreatment == "Multi injection d insulines") {
    print("Je suis dans le cas Multi injection");
    if (oneActivity.timemeal > 2) {
      print("je suis dans le cas loin d'un repas");
      proposition += injectionLoinRepas(activity.intensity);
    }
    if (oneActivity.timemeal <= 2) {
      print("je suis dans le cas proche d'un repas");
      proposition += injectionProcheRepas(activity.intensity);
    }
    //else {
      //proposition += "Il y a eu un problème (injection)";
    //}
  }
  //else {
    //proposition += "Il y a eu un problème (user treatment)";
  //}
  proposition += "\nSi votre activité physique dure plus d'une heure, pensez à prendre une collation de 15 à 20 g de glucides par heure\n";
  print("finishthinking");
  return proposition;
}*/

String pompeLoinRepas(String intensity) {
  print("je suis dans la fonction pompe loin repas");
  print(intensity);
  String proposition = "";
  if (intensity == "Intense") {
    print("je suis dans le cas intense");
    proposition += "ADIAP vous propose d'arrêter votre débit de base pendant la durée de votre activité physique\n";
  }
  if (intensity == "Modérée") {
    print("je suis dans le cas modéré");
    proposition += "ADIAP vous propose une diminution de votre débit de base de 80 à 65 % pendant la durée de votre activité physique + 2 heures après";
  }
  if (intensity == "Légère") {
    print("je suis dans le cas légère");
    proposition += "ADIAP vous propose une diminution de votre débit de base de 65 à 50 % pendant la durée de votre activité physique + 2 heures après";
  }
  //else {
    //proposition += "Il y a eu un problème (pompe Loin)";
  //}
  return proposition + "\n";
}

String pompeProcheRepas(String intensity) {
  print("je suis dans la fonction pompe proche repas");
  String proposition = "";
  print(intensity);
  if (intensity == "Modérée" || intensity == "Légère") {
    print("je suis dans le cas modéré ou légère");
    proposition += pompeLoinRepas(intensity) + ", ainsi que de réduire votre bolus de 50 à 30 %\n";
  }
  if (intensity == "Intense") {
    print("je suis dans le cas intense");
    proposition += pompeLoinRepas(intensity) + ", ainsi que de réduire votre bolus de 80 à 50 %\n";
  }
  //else {
    //proposition += "Il y a eu un problème (pompe proche)";
  //}
  return proposition + "\n";
}

String injectionLoinRepas(String intensity) {
  print("je suis dans la fonction injection loin repas");
  String proposition = "ADIAP vous propose de ne pas modifier la dose d'insuline prévue pour votre repas\n";
  return proposition + "\n";
}

String injectionProcheRepas(String intensity) {
  print("je suis dans la fonction injection proche repas");
  String proposition = "";
  print(intensity);
  if (intensity == "Intense") {
    print("je suis dans le cas intense");
    proposition += "ADIAP vous propose une diminution de 80 à 60 % de l'injection du repas le plus proche (bolus et correction)\n";
  }
  if (intensity == "Modérée") {
    print("je suis dans le cas modéré");
    proposition += "ADIAP vous propose une diminution de 65 à 45 % de l'injection du repas le plus proche (bolus et correction)\n";
  }
  if (intensity == "Légère") {
    print("je suis dans le cas légère");
    proposition += "ADIAP vous propose une diminution de 50 à 30 % de l'injection du repas le plus proche (bolus et correction)\n";
  }
  //else {
    //proposition += "Il y a eu un problème (pompe Loin)";
  //}
  return proposition + "\n";
}

String propositionResucrage(int aiming, int actual, int weight) {
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