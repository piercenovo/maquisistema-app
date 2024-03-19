import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/images.dart';
import 'package:maquisistema_app/core/constants/sizes.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: AppImages.networkLogoApp,
      height: AppSizes.logoHeight,
      placeholder: (context, url) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.assetLogoApp,
              ),
            ),
          ),
          height: AppSizes.logoHeight,
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.assetLogoApp,
              ),
            ),
          ),
          height: AppSizes.logoHeight,
        );
      },
    );
  }
}
