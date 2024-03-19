// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/pokemon/data/models/ability_model.dart';
import 'package:maquisistema_app/features/pokemon/data/models/sprite_model.dart';
import 'package:maquisistema_app/features/pokemon/data/models/type_model.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';

class PokemonDetailModel extends PokemonDetailEntity {
  final int id;
  final List<AbilitiesModel> abilities;
  final int baseExperience;
  final int height;
  final String name;
  final int order;
  final SpritesModel sprites;
  final List<TypesModel> types;

  const PokemonDetailModel({
    required this.id,
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.name,
    required this.order,
    required this.sprites,
    required this.types,
  }) : super(
          id: id,
          abilities: abilities,
          baseExperience: baseExperience,
          height: height,
          name: name,
          order: order,
          sprites: sprites,
          types: types,
        );

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    final abilities = json["abilities"] ?? [];
    final types = json["types"] ?? [];

    return PokemonDetailModel(
      id: json["id"],
      abilities: List<AbilitiesModel>.from(
          abilities.map((x) => AbilitiesModel.fromJson(x))),
      baseExperience: json["baseExperience"] ?? 0,
      height: json["height"],
      name: json["name"],
      order: json["order"],
      sprites: SpritesModel.fromJson(json["sprites"] ?? {}),
      types: List<TypesModel>.from(types.map((x) => TypesModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "baseExperience": baseExperience,
        "height": height,
        "name": name,
        "order": order,
        "sprites": sprites,
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };

  static List<PokemonDetailModel> fromJsonList(List<dynamic> jsonList) {
    return List<PokemonDetailModel>.from(
        jsonList.map((x) => PokemonDetailModel.fromJson(x)));
  }
}
