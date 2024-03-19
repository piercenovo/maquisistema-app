// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_results_entity.dart';

class PokemonResultsModel extends PokemonResultsEntity {
  final int count;
  final String next;
  final String previus;
  final List<PokemonModel> results;

  const PokemonResultsModel({
    required this.count,
    required this.next,
    required this.previus,
    required this.results,
  }) : super(
          count: count,
          next: next,
          previus: previus,
          results: results,
        );

  factory PokemonResultsModel.fromJson(Map<String, dynamic> json) {
    final results = json["results"] ?? [];

    return PokemonResultsModel(
      count: json["count"],
      next: json["next"],
      previus: json["previus"] ?? '',
      results:
          List<PokemonModel>.from(results.map((x) => PokemonModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previus": previus,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };

  static List<PokemonResultsModel> fromJsonList(List<dynamic> jsonList) {
    return List<PokemonResultsModel>.from(
        jsonList.map((x) => PokemonResultsModel.fromJson(x)));
  }
}
