// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/pokemon/domain/entities/ability_entity.dart';

class AbilitiesModel extends AbilitiesEntity {
  final AbilityModel ability;
  final bool isHidden;
  final int slot;

  const AbilitiesModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  }) : super(
          ability: ability,
          isHidden: isHidden,
          slot: slot,
        );

  factory AbilitiesModel.fromJson(Map<String, dynamic> json) {
    return AbilitiesModel(
      ability: AbilityModel.fromJson(json["ability"]),
      isHidden: json["isHidden"] ?? false,
      slot: json["slot"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ability": ability,
        "isHidden": isHidden,
        "slot": slot,
      };

  static List<AbilitiesModel> fromJsonList(List<dynamic> jsonList) {
    return List<AbilitiesModel>.from(
        jsonList.map((x) => AbilitiesModel.fromJson(x)));
  }
}

class AbilityModel extends AbilityEntity {
  final String name;
  final String url;

  const AbilityModel({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  static List<AbilityModel> fromJsonList(List<dynamic> jsonList) {
    return List<AbilityModel>.from(
        jsonList.map((x) => AbilityModel.fromJson(x)));
  }
}
