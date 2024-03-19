import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_results_entity.dart';
import 'package:maquisistema_app/features/pokemon/domain/usecases/get_pokemon_by_index_usecase.dart';
import 'package:maquisistema_app/features/pokemon/domain/usecases/get_pokemons_usecase.dart';
part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemonsUsecase getPokemonsUsecase;
  final GetPokemonByIndexUsecase getPokemonByIndexUsecase;

  PokemonCubit(
      {required this.getPokemonsUsecase,
      required this.getPokemonByIndexUsecase})
      : super(PokemonInitial());

  Future<void> getPokemons() async {
    emit(PokemonLoading());
    final failureOrPokemon = await getPokemonsUsecase();

    failureOrPokemon.fold(
        (failure) => emit(PokemonFailure(error: failure.toString())),
        (time) => emit(PokemonsLoaded(time)));
  }

  Future<void> getPokemonByIndex({required String id}) async {
    emit(PokemonLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    final failureOrPokemon = await getPokemonByIndexUsecase(id: id);
    failureOrPokemon.fold(
        (failure) => emit(PokemonFailure(error: failure.toString())),
        (time) => emit(PokemonLoaded(time)));
  }
}
