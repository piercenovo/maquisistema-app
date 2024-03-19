import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/content_pokemon_detail_widget.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/header_pokemon_detail_widget.dart';

class PokemonDetailBodyWidget extends StatelessWidget {
  const PokemonDetailBodyWidget({
    super.key,
    required this.pokemonLoaded,
  });

  final PokemonDetailEntity pokemonLoaded;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppColors.primary,
            height: size.height,
            child: Stack(
              children: [
                ContentPokemonDetailWidget(pokemonLoaded: pokemonLoaded),
                HeaderPokemonDetailWidget(pokemonLoaded: pokemonLoaded)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
