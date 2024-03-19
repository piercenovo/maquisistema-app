
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';
import 'package:maquisistema_app/core/utils/string_utils.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';

class HeaderPokemonDetailWidget extends StatelessWidget {
  const HeaderPokemonDetailWidget({
    super.key,
    required this.pokemonLoaded,
  });

  final PokemonDetailEntity pokemonLoaded;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstLetterCapital(pokemonLoaded.name),
            style: txtTheme.headlineLarge?.apply(
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: AppSizes.padding1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#${pokemonLoaded.id}',
                style: txtTheme.displayLarge
                    ?.apply(color: AppColors.greyLight, fontSizeDelta: -2),
              ),
              const SizedBox(width: AppSizes.padding7),
              Expanded(
                  child: CachedNetworkImage(
                imageUrl: getPokemonImageSecondary(
                  pokemonLoaded.id.toString(),
                ),
                fit: BoxFit.fill,
              ))
            ],
          )
        ],
      ),
    );
  }
}
