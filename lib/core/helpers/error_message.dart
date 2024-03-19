import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';

void errorMessageSnack(BuildContext context, String error) {
  final txtTheme = Theme.of(context).textTheme;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      error,
      style: txtTheme.labelMedium?.apply(
        color: AppColors.white,
        fontWeightDelta: 2,
      ),
    ),
    backgroundColor: AppColors.error,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
  ));
}
