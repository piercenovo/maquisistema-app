import 'package:dartz/dartz.dart';
import 'package:maquisistema_app/core/errors/server_failure.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonByIndexUsecase {
  final PokemonRepository repository;

  GetPokemonByIndexUsecase({required this.repository});

  Future<Either<Failure, PokemonDetailEntity>> call(
      {required String id}) async {
    return await repository.getPokemonByIndex(id: id);
  }
}
