import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/Classes/User.dart';
import 'package:flutter/material.dart';
import 'Classes/activity.dart';

String giveproposition(User user, OneActivity oneActivity, Activity activity) {
  String proposition = "";
  if (oneActivity.aimglycemie < oneActivity.actglycemie){
    proposition += propositionResucrage(oneActivity.aimglycemie, oneActivity.actglycemie, user.weight);
  }
  if (user.diabTreatment == "Pompe à insuline") {
    if (oneActivity.timemeal > 2) {
      proposition += pompeLoinRepas(activity.intensity);
    }
    if (oneActivity.timemeal <= 2) {
      proposition += pompeProcheRepas(activity.intensity);
    }
    else {
      return "Il y a eu un problème (pompe)";
    }
  }
  if (user.diabTreatment == "Multi injection d insulines") {
    if (oneActivity.timemeal > 2) {
      print("je suis là");
      proposition += injectionLoinRepas(activity.intensity);
    }
    if (oneActivity.timemeal <= 2) {
      proposition += injectionProcheRepas(activity.intensity);
    }
    else {
      print("et aussi là");
      return "Il y a eu un problème (injection)";
    }
  }
  else {
    proposition += "Il y a eu un problème (user treatment)";
  }
  proposition += "Si votre activité physique dure plus d'une heure, pensez à prendre une collation de 15 à 20 g de glucides par heure\n";
  return proposition;
}

String pompeLoinRepas(String intensity) {
  String proposition = "";
  if (intensity == "Intense") {
    proposition = "ADIAP vous propose d'arrêter votre débit de base pendant la durée de votre activité physique\n";
  }
  if (intensity == "Modérée") {
    proposition = "ADIAP vous propose une diminution de votre débit de base de 80 à 65 % pendant la durée de votre activité physique + 2 heures après";
  }
  if (intensity == "Légère") {
    proposition = "ADIAP vous propose une diminution de votre débit de base de 65 à 50 % pendant la durée de votre activité physique + 2 heures après";
  }
  else {
    proposition = "Il y a eu un problème (pompe Loin)";
  }
  return proposition;
}

String pompeProcheRepas(String intensity) {
  String proposition = "";
  if (intensity == "Modérée" || intensity == "Légère") {
    proposition = pompeLoinRepas(intensity) + ", ainsi que de réduire votre bolus de 50 à 30 %\n";
  }
  if (intensity == "Intense") {
    proposition = pompeLoinRepas(intensity) + ", ainsi que de réduire votre bolus de 80 à 50 %\n";
  }
  else {
    proposition = "Il y a eu un problème (pompe proche)";
  }
  return proposition;
}

String injectionLoinRepas(String intensity) {
  String proposition = "ADIAP vous propose de ne pas modifier la dose d'insuline prévue pour votre repas\n";
  return proposition;
}

String injectionProcheRepas(String intensity) {
  String proposition = "";
  if (intensity == "Intense") {
    proposition = "ADIAP vous propose une diminution de 80 à 60 % de l'injection du repas le plus proche (bolus et correction)\n";
  }
  if (intensity == "Modérée") {
    proposition = "ADIAP vous propose une diminution de 65 à 45 % de l'injection du repas le plus proche (bolus et correction)\n";
  }
  if (intensity == "Légère") {
    proposition = "ADIAP vous propose une diminution de 50 à 30 % de l'injection du repas le plus proche (bolus et correction)\n";
  }
  else {
    proposition = "Il y a eu un problème (pompe Loin)";
  }
  return proposition;
}

String propositionResucrage(int aiming, int actual, int weight) {
  String proposition = "";
    proposition += "ADIAP vous suggère de vous resucrez avant le début de votre activité physique pour atteindre la glycémie visée\n";
    int a_combler = aiming - actual;
    int pour_combler_g;
    int val_10g;
    if ( weight <= 40 ) {
      val_10g = 75;
    }
    if ( 40 < weight && weight <= 50 ) {
      val_10g = 50;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    if ( 50 < weight && weight <= 60 ) {
      val_10g = 45;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    if ( 60 < weight && weight <= 70 ) {
      val_10g = 40;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    if ( 70 < weight && weight <= 80 ) {
      val_10g = 35;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    if ( 80 < weight && weight <= 90 ) {
      val_10g = 30;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    if ( 90 < weight && weight <= 100 ) {
      val_10g = 25;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    if ( 100 < weight && weight <= 110 ) {
      val_10g = 20;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    if ( 100 < weight) {
      val_10g = 15;
      pour_combler_g = (a_combler*10)%val_10g;
      proposition += "ADIAP vous suggère de prendre $pour_combler_g g de glucides maintenant\n";
    }
    else {
      return "Il y a eu un problème (resucrage)";
    }
  return proposition;
}