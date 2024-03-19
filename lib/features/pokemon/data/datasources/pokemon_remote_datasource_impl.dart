// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maquisistema_app/core/constants/api_paths.dart';
import 'package:maquisistema_app/core/errors/server_exception.dart';
import 'package:maquisistema_app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:maquisistema_app/features/pokemon/data/models/pokemon_detail_model.dart';
import 'package:maquisistema_app/features/pokemon/data/models/pokemon_results_model.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<PokemonResultsModel> getPokemons() async {
    final response = await client.get(
      Uri.parse(APIPaths.pokemonsApi),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PokemonResultsModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonDetailModel> getPokemonByIndex({required String id}) async {
    final response = await client.get(
      Uri.parse('${APIPaths.pokemonsApi}/$id'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PokemonDetailModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
