import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';

class TypeDot extends StatelessWidget {
  const TypeDot({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppSizes.bodyPadding / 2),
      height: 34,
      width: 34,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.4),
        ),
        child: Icon(
          icon,
          color: color,
          size: 25,
        ),
      ),
    );
  }
}
