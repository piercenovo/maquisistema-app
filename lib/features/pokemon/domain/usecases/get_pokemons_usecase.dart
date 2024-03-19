import 'package:dartz/dartz.dart';
import 'package:maquisistema_app/core/errors/server_failure.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_results_entity.dart';
import 'package:maquisistema_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonsUsecase {
  final PokemonRepository repository;

  GetPokemonsUsecase({required this.repository});

  Future<Either<Failure, PokemonResultsEntity>> call() async {
    return await repository.getPokemons();
  }
}
