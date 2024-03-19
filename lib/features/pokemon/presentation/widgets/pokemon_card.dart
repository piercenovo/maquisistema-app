// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';
import 'package:maquisistema_app/core/helpers/navigator.dart';
import 'package:maquisistema_app/core/utils/string_utils.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:maquisistema_app/features/pokemon/presentation/screens/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        print(getPokemonIndex(pokemon.url));

        pushToPage(
          context,
          PokemonDetailScreen(
            id: getPokemonIndex(pokemon.url),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  firstLetterCapital(pokemon.name),
                  style: txtTheme.bodyMedium
                      ?.apply(color: AppColors.primary, fontWeightDelta: 2),
                ),
                Text(
                  '#${getPokemonIndex(pokemon.url)}',
                  style: txtTheme.bodyMedium?.apply(
                      color: AppColors.text3.withOpacity(0.7),
                      fontWeightDelta: 2),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.smallPadding2),
            CachedNetworkImage(
              imageUrl: getPokemonImage(pokemon.url),
              height: 100,
              placeholder: (context, url) {
                return const SizedBox(
                  height: 100,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
