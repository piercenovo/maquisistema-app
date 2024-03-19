// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/pokemon/domain/entities/sprite_entity.dart';

class SpritesModel extends SpritesEntity {
  final String frontDefault;
  final String backDefault;
  final OtherModel other;

  const SpritesModel({
    required this.frontDefault,
    required this.backDefault,
    required this.other,
  }) : super(
          frontDefault: frontDefault,
          backDefault: backDefault,
          other: other,
        );

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(
      frontDefault: json["frontDefault"] ?? '',
      backDefault: json["backDefault"] ?? '',
      other: OtherModel.fromJson(json["other"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "frontDefault": frontDefault,
        "backDefault": backDefault,
        "other": other,
      };

  static List<SpritesModel> fromJsonList(List<dynamic> jsonList) {
    return List<SpritesModel>.from(
        jsonList.map((x) => SpritesModel.fromJson(x)));
  }
}

class OtherModel extends OtherEntity {
  final OfficialArtworkModel officialArtwork;

  const OtherModel({
    required this.officialArtwork,
  }) : super(
          officialArtwork: officialArtwork,
        );

  factory OtherModel.fromJson(Map<String, dynamic> json) {
    return OtherModel(
      officialArtwork:
          OfficialArtworkModel.fromJson(json["officialArtwork"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "officialArtwork": officialArtwork,
      };

  static List<OtherModel> fromJsonList(List<dynamic> jsonList) {
    return List<OtherModel>.from(jsonList.map((x) => OtherModel.fromJson(x)));
  }
}

class OfficialArtworkModel extends OfficialArtworkEntity {
  final String frontDefault;
  final String backDefault;

  const OfficialArtworkModel({
    required this.frontDefault,
    required this.backDefault,
  }) : super(
          frontDefault: frontDefault,
          backDefault: frontDefault,
        );

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json["frontDefault"] ?? '',
      backDefault: json["backDefault"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "frontDefault": frontDefault,
        "backDefault": backDefault,
      };

  static List<OfficialArtworkModel> fromJsonList(List<dynamic> jsonList) {
    return List<OfficialArtworkModel>.from(
        jsonList.map((x) => OfficialArtworkModel.fromJson(x)));
  }
}
