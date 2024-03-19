import 'package:maquisistema_app/core/di/injection_container.dart';
import 'package:maquisistema_app/features/pokemon/data/datasources/pokemon_remote_datasource.dart';
import 'package:maquisistema_app/features/pokemon/data/datasources/pokemon_remote_datasource_impl.dart';
import 'package:maquisistema_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:maquisistema_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:maquisistema_app/features/pokemon/domain/usecases/get_pokemon_by_index_usecase.dart';
import 'package:maquisistema_app/features/pokemon/domain/usecases/get_pokemons_usecase.dart';
import 'package:maquisistema_app/features/pokemon/presentation/cubits/pokemon/pokemon_cubit.dart';

Future<void> pokemonInjectionContainer() async {
  // Cubits
  sl.registerFactory<PokemonCubit>(
    () => PokemonCubit(
      getPokemonsUsecase: sl.call(),
      getPokemonByIndexUsecase: sl.call(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetPokemonsUsecase>(
    () => GetPokemonsUsecase(repository: sl.call()),
  );

  sl.registerLazySingleton<GetPokemonByIndexUsecase>(
    () => GetPokemonByIndexUsecase(repository: sl.call()),
  );

  // Repositories
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      remoteDataSource: sl.call(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl.call()),
  );
}
