



class OneActivity {
  final int idOne;
  final int aimglycemie;
  final int actglycemie;
  final int timebefore;
  final int timemeal;
  final int idAssociatedActivity;
  static final columns = ['idOne', 'aimglycemie', 'actglycemie', 'timebefore', 'timemeal', 'idAssociatedActivity'];

  const OneActivity ({
    required this.idOne,
    required this.aimglycemie,
    required this.actglycemie,
    required this.timebefore,
    required this.timemeal,
    required this.idAssociatedActivity,
});

  factory OneActivity.fromMap(Map<dynamic, dynamic> data) {
    return OneActivity(
      idOne: data["idOne"], aimglycemie: data['aimglycemie'], actglycemie: data['actglycemie'], timebefore: data['timebefore'], timemeal: data['timemeal'], idAssociatedActivity: data['iidAssociatedActivity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idOne' : idOne,
      'aimglycemie' : aimglycemie,
      'actglycemie' : actglycemie,
      'timebefore' : timebefore,
      'timemeal' : timemeal,
      'idAssociatedActivity': idAssociatedActivity,
    };
  }

  @override
  String toString() {
    return 'OneActivity{idOne: $idOne, aimglycemie: $aimglycemie, actglycemie: $actglycemie, timebefore: $timebefore, timemeal: $timemeal, idAssociatedActivity: $idAssociatedActivity}';
  }
}