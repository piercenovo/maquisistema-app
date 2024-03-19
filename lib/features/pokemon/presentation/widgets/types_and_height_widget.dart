
import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/types_widget.dart';

class TypesAndHeightWidget extends StatelessWidget {
  const TypesAndHeightWidget({
    super.key,
    required this.pokemonLoaded,
  });

  final PokemonDetailEntity pokemonLoaded;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TypesWidget(pokemonLoaded: pokemonLoaded),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Altura:\n',
                  style: txtTheme.titleMedium?.apply(
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: '${pokemonLoaded.height} mtrs.',
                  style: txtTheme.headlineMedium?.apply(
                    color: AppColors.text2,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
