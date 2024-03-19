import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/type_dot.dart';

class TypesWidget extends StatelessWidget {
  const TypesWidget({
    super.key,
    required this.pokemonLoaded,
  });

  final PokemonDetailEntity pokemonLoaded;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    bool hasGrassType =
        pokemonLoaded.types.any((type) => type.type.name == 'grass');

    bool hasPoisonType =
        pokemonLoaded.types.any((type) => type.type.name == 'poison');

    bool hasFireType =
        pokemonLoaded.types.any((type) => type.type.name == 'fire');

    bool hasFlyingType =
        pokemonLoaded.types.any((type) => type.type.name == 'flying');

    bool hasWaterType =
        pokemonLoaded.types.any((type) => type.type.name == 'water');

    bool hasBugType =
        pokemonLoaded.types.any((type) => type.type.name == 'bug');

    bool hasNormalType =
        pokemonLoaded.types.any((type) => type.type.name == 'normal');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tipos:',
          style: txtTheme.titleMedium?.apply(
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: AppSizes.smallPadding2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasGrassType)
              const TypeDot(
                icon: TablerIcons.seeding,
                color: AppColors.sheet,
              ),
            if (hasPoisonType)
              const TypeDot(
                icon: TablerIcons.glass_full,
                color: AppColors.poison,
              ),
            if (hasFireType)
              const TypeDot(
                icon: TablerIcons.flame,
                color: AppColors.flame,
              ),
            if (hasFlyingType)
              const TypeDot(
                icon: TablerIcons.feather,
                color: AppColors.flying,
              ),
            if (hasWaterType)
              const TypeDot(
                icon: TablerIcons.droplet,
                color: AppColors.water,
              ),
            if (hasBugType)
              const TypeDot(
                icon: TablerIcons.bug,
                color: AppColors.bug,
              ),
            if (hasNormalType)
              const TypeDot(
                icon: TablerIcons.military_rank,
                color: AppColors.normal,
              ),
          ],
        ),
      ],
    );
  }
}
