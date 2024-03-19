
import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/skills_widget.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/types_and_height_widget.dart';

class ContentPokemonDetailWidget extends StatelessWidget {
  const ContentPokemonDetailWidget({
    super.key,
    required this.pokemonLoaded,
  });

  final PokemonDetailEntity pokemonLoaded;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<String> abilityNames =
        pokemonLoaded.abilities.map((e) => e.ability.name).toList();
    String abilitiesString = abilityNames.join(', ');

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      padding: EdgeInsets.only(
        top: size.height * 0.12,
        left: AppSizes.bodyPadding,
        right: AppSizes.bodyPadding,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypesAndHeightWidget(pokemonLoaded: pokemonLoaded),
          SkillsWidget(abilitiesString: abilitiesString),
        ],
      ),
    );
  }
}
