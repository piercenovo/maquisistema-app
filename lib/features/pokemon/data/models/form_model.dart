// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/pokemon/data/models/type_model.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/form_entity.dart';

class FormModel extends FormEntity {
  final int id;
  final String name;
  final int order;
  final List<TypesModel> types;

  const FormModel({
    required this.id,
    required this.name,
    required this.order,
    required this.types,
  }) : super(
          id: id,
          name: name,
          order: order,
          types: types,
        );

  factory FormModel.fromJson(Map<String, dynamic> json) {
    final types = json["types"] ?? [];

    return FormModel(
      id: json["id"],
      name: json["name"],
      order: json["order"],
      types: List<TypesModel>.from(types.map((x) => TypesModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "order": order,
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };

  static List<FormModel> fromJsonList(List<dynamic> jsonList) {
    return List<FormModel>.from(jsonList.map((x) => FormModel.fromJson(x)));
  }
}
