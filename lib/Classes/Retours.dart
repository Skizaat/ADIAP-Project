class Retour {
  final int idRetour;
  final int idOneActivity;
  final String stateGly;
  final String commentary;
  static final columns = ['idRetour', 'idOneActivity', 'proposition', 'stateGly', "commentary"];

  const Retour ({
    required this.idRetour,
    required this.idOneActivity,
    required this.stateGly,
    required this.commentary,
  });

  factory Retour.fromMap(Map<dynamic, dynamic> data) {
    return Retour(
      idRetour: data["idRetour"], idOneActivity: data['idOneActivity'], stateGly: data['stateGly'], commentary: data['commentary'],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'idRetour' : idRetour,
      'idOneActivity' : idOneActivity,
      'stateGly' : stateGly,
      'commentary': commentary,
    };
  }
  //Ben Stiller
  @override
  String toString() {
    return 'Retour{idRetour: $idRetour, idOneActivity: $idOneActivity, stateGly: $stateGly, commentary: $commentary}';
  }
}