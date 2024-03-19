// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';
import 'package:maquisistema_app/core/utils/date_utils.dart';
import 'package:maquisistema_app/features/welcome/domain/entities/time_entity.dart';
import 'package:maquisistema_app/features/welcome/presentation/cubits/time_cubit.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget({
    super.key,
    this.time,
  });

  TimeEntity? time;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Positioned(
      bottom: AppSizes.timePadding,
      child: BlocBuilder<TimeCubit, TimeState>(
        buildWhen: (context, state) {
          return state is TimeLoaded;
        },
        builder: (context, state) {
          if (state is TimeInitial || state is TimeLoading) {
            return Text(
              getDateNow(),
              style: txtTheme.titleMedium?.apply(color: AppColors.text3),
            );
          } else if (state is TimeLoaded) {
            time = state.time;

            return Text(
              getDateFormat(time!.dateTime),
              style: txtTheme.titleMedium?.apply(color: AppColors.text3),
            );
          }
          return Text(
            getDateNow(),
            style: txtTheme.titleMedium?.apply(color: AppColors.text3),
          );
        },
      ),
    );
  }
}
