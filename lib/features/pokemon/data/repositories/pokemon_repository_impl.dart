import 'package:dartz/dartz.dart';
import 'package:maquisistema_app/core/errors/server_exception.dart';
import 'package:maquisistema_app/core/errors/server_failure.dart';
import 'package:maquisistema_app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:maquisistema_app/features/pokemon/data/models/pokemon_detail_model.dart';
import 'package:maquisistema_app/features/pokemon/data/models/pokemon_results_model.dart';
import 'package:maquisistema_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  const PokemonRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<ServerFailure, PokemonResultsModel>> getPokemons() async {
    try {
      final PokemonResultsModel pokemons = await remoteDataSource.getPokemons();
      return Right(pokemons);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, PokemonDetailModel>> getPokemonByIndex(
      {required String id}) async {
    try {
      final PokemonDetailModel pokemon =
          await remoteDataSource.getPokemonByIndex(id: id);
      return Right(pokemon);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
