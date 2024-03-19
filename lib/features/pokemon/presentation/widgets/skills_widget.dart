
import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';
import 'package:maquisistema_app/core/utils/string_utils.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({
    super.key,
    required this.abilitiesString,
  });

  final String abilitiesString;

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Habilidades:\n',
            style: txtTheme.titleMedium?.apply(
              color: AppColors.primary,
              heightDelta: -0.6,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstLetterCapital(abilitiesString),
                style: txtTheme.bodyMedium?.apply(
                  color: AppColors.text2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
