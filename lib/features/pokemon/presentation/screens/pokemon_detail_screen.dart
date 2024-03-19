// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:maquisistema_app/features/pokemon/presentation/cubits/pokemon/pokemon_cubit.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/custom_cubit_consumer.dart';
import 'package:maquisistema_app/features/pokemon/presentation/widgets/pokemon_detail_body_widget.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  PokemonDetailEntity? pokemonLoaded;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    BlocProvider.of<PokemonCubit>(context).getPokemonByIndex(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.primary,
      body: CustomCubitConsumer<PokemonCubit>(
        cubit: BlocProvider.of<PokemonCubit>(context),
        successListener: (context, state) {
          if (state is PokemonLoaded) {
            pokemonLoaded = state.pokemon;
          }
        },
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            );
          }

          if (state is PokemonLoaded) {
            return PokemonDetailBodyWidget(
              pokemonLoaded: pokemonLoaded!,
            );
          }
        },
        isBuildWhen: true,
        goBack: true,
        successStateType: PokemonLoaded,
        failureStateType: PokemonFailure,
      ),
    );
  }
}
