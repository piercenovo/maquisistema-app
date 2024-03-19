// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';
import 'package:maquisistema_app/core/helpers/error_message.dart';
import 'package:maquisistema_app/core/helpers/shimmer_widget.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_results_entity.dart';
import 'package:maquisistema_app/features/pokemon/presentation/cubits/pokemon/pokemon_cubit.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonsScreen extends StatefulWidget {
  const PokemonsScreen({super.key});

  @override
  State<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends State<PokemonsScreen> {
  PokemonResultsEntity? pokemonResults;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonCubit>(context).getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maquisistema'),
      ),
      body: Container(
        color: AppColors.bg,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: BlocConsumer<PokemonCubit, PokemonState>(
          buildWhen: (context, state) {
            return state is PokemonsLoaded;
          },
          listener: (context, state) {
            if (state is PokemonFailure) {
              errorMessageSnack(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is PokemonInitial || state is PokemonLoadingWidget) {
              return const PokemonLoadingWidget();
            } else if (state is PokemonsLoaded) {
              pokemonResults = state.pokemons;

              final pokemons = pokemonResults!.results;

              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.15,
                  ),
                  shrinkWrap: true,
                  itemCount: pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemons[index];

                    return PokemonCard(pokemon: pokemon);
                  });
            }
            return const PokemonLoadingWidget();
          },
        ),
      ),
    );
  }
}

class PokemonLoadingWidget extends StatelessWidget {
  const PokemonLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.15,
      ),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
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
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShimmerWidget.rectangular(
                    width: 65,
                    height: 16,
                  ),
                  ShimmerWidget.rectangular(
                    width: 30,
                    height: 16,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.padding2),
              ShimmerWidget.circular(
                width: 90,
                height: 90,
              ),
            ],
          ),
        );
      },
    );
  }
}
