// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/pokemon/domain/entities/type_entity.dart';

class TypesModel extends TypesEntity {
  final int slot;
  final TypeModel type;

  const TypesModel({
    required this.slot,
    required this.type,
  }) : super(
          slot: slot,
          type: type,
        );

  factory TypesModel.fromJson(Map<String, dynamic> json) {
    return TypesModel(
      slot: json["slot"],
      type: TypeModel.fromJson(json["type"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type,
      };

  static List<TypesModel> fromJsonList(List<dynamic> jsonList) {
    return List<TypesModel>.from(jsonList.map((x) => TypesModel.fromJson(x)));
  }
}

class TypeModel extends TypeEntity {
  final String name;
  final String url;

  const TypeModel({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  static List<TypeModel> fromJsonList(List<dynamic> jsonList) {
    return List<TypeModel>.from(jsonList.map((x) => TypeModel.fromJson(x)));
  }
}
