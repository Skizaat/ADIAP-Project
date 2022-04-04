import 'package:equatable/equatable.dart';

class User extends Equatable{
  const User({
    required this.id,
    required this.name,
    required this.weight,
    required this.diabTreatment,
  });

  final int id;
  final String name;
  final int weight;
  final int diabTreatment;

  User.fromJson(Map<String, dynamic> map)
      : id = (map['id'] as num).toInt(),
        name = map['name'] as String,
        weight = (map['weight'] as num).toInt() ,
        diabTreatment = (map['diabTreatment'] as num).toInt();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'weight': weight,
      'diabTreatment': diabTreatment,
    };
  }

  @override
  String toString() {
    return 'User:\n\tId: $id\n\tName: $name\n\tWeight: $weight\n\tTreatement: $diabTreatment\n\t';
  }

  @override
  List<Object> get props => [name, id, weight, diabTreatment];
}
