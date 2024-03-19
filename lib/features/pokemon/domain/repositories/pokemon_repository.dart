import 'package:dartz/dartz.dart';
import 'package:maquisistema_app/core/errors/server_failure.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_results_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonResultsEntity>> getPokemons();

  Future<Either<Failure, PokemonDetailEntity>> getPokemonByIndex(
      {required String id});
}
