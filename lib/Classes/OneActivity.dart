



class OneActivity {
  final int idOne;
  final int aimglycemie;
  final int actglycemie;
  final int timebefore;
  final int timemeal;
  final int idAssociatedActivity;
  final String date;
  static final columns = ['idOne', 'aimglycemie', 'actglycemie', 'timebefore', 'timemeal', 'idAssociatedActivity', 'date'];

  const OneActivity ({
    required this.idOne,
    required this.aimglycemie,
    required this.actglycemie,
    required this.timebefore,
    required this.timemeal,
    required this.idAssociatedActivity,
    required this.date,
});

  factory OneActivity.fromMap(Map<dynamic, dynamic> data) {
    return OneActivity(
      idOne: data["idOne"], aimglycemie: data['aimglycemie'], actglycemie: data['actglycemie'], timebefore: data['timebefore'], timemeal: data['timemeal'], idAssociatedActivity: data['idAssociatedActivity'], date: data['date']
    );
  }

  get getdate => date;

  Map<String, dynamic> toMap() {
    return {
      'idOne' : idOne,
      'aimglycemie' : aimglycemie,
      'actglycemie' : actglycemie,
      'timebefore' : timebefore,
      'timemeal' : timemeal,
      'idAssociatedActivity': idAssociatedActivity,
      'date' : date,
    };
  }

  @override
  String toString() {
    return 'OneActivity{idOne: $idOne, aimglycemie: $aimglycemie, actglycemie: $actglycemie, timebefore: $timebefore, timemeal: $timemeal, idAssociatedActivity: $idAssociatedActivity, date: $date}';
  }

  int getactglycemie() {
    return actglycemie;
  }

  int getaimglycemie() {
    return aimglycemie;
  }

  int gettimebefore() {
    return timebefore;
  }
}