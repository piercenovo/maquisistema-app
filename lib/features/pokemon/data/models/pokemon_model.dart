// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  final String name;
  final String url;

  const PokemonModel({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  static List<PokemonModel> fromJsonList(List<dynamic> jsonList) {
    return List<PokemonModel>.from(
        jsonList.map((x) => PokemonModel.fromJson(x)));
  }
}
