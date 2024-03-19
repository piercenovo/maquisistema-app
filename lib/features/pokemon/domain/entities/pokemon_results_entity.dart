import 'package:equatable/equatable.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonResultsEntity extends Equatable {
  final int count;
  final String next;
  final String previus;
  final List<PokemonEntity> results;

  const PokemonResultsEntity({
    required this.count,
    required this.next,
    required this.previus,
    required this.results,
  });

  @override
  List<Object?> get props => [
        count,
        next,
        previus,
        results,
      ];
}
