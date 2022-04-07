class Proposition {
  final int idProposition;
  final int idOneActivity;
  final String proposition;
  static final columns = ['idProposition', 'idOneActivity', 'proposition'];

  const Proposition ({
    required this.idProposition,
    required this.idOneActivity,
    required this.proposition,
  });

  factory Proposition.fromMap(Map<dynamic, dynamic> data) {
    return Proposition(
        idProposition: data["idProposition"], idOneActivity: data['idOneActivity'], proposition: data['proposition'],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'idProposition' : idProposition,
      'idOneActivity' : idOneActivity,
      'proposition' : proposition,
    };
  }
  //Ben Stiller
  @override
  String toString() {
    return 'OneActivity{idProposition: $idProposition, idOneActivity: $idOneActivity, proposition: $proposition}';
  }

}