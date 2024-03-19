import 'package:equatable/equatable.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/ability_entity.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/sprite_entity.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/type_entity.dart';

class PokemonDetailEntity extends Equatable {
  final int id;
  final List<AbilitiesEntity> abilities;
  final int baseExperience;
  final int height;
  final String name;
  final int order;
  final SpritesEntity sprites;
  final List<TypesEntity> types;

  const PokemonDetailEntity({
    required this.id,
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.name,
    required this.order,
    required this.sprites,
    required this.types,
  });

  @override
  List<Object?> get props => [
        id,
        abilities,
        baseExperience,
        height,
        name,
        order,
        sprites,
        types,
      ];
}
