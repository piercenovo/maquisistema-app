import 'package:maquisistema_app/features/pokemon/data/models/pokemon_detail_model.dart';
import 'package:maquisistema_app/features/pokemon/data/models/pokemon_results_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonResultsModel> getPokemons();
  Future<PokemonDetailModel> getPokemonByIndex({required String id});
}
