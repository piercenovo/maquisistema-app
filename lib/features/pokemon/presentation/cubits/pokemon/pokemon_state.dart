part of 'pokemon_cubit.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitial extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoading extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonsLoaded extends PokemonState {
  final PokemonResultsEntity pokemons;

  const PokemonsLoaded(this.pokemons);

  @override
  List<Object> get props => [pokemons];
}

class PokemonLoaded extends PokemonState {
  final PokemonDetailEntity pokemon;

  const PokemonLoaded(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

class PokemonFailure extends PokemonState {
  final String error;

  const PokemonFailure({required this.error});

  @override
  List<Object> get props => [error];
}
