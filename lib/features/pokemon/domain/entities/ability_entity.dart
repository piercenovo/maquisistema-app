import 'package:equatable/equatable.dart';

class AbilitiesEntity extends Equatable {
  final AbilityEntity ability;
  final bool isHidden;
  final int slot;

  const AbilitiesEntity({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  @override
  List<Object?> get props => [
        ability,
        isHidden,
        slot,
      ];
}

class AbilityEntity extends Equatable {
  final String name;
  final String url;

  const AbilityEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
