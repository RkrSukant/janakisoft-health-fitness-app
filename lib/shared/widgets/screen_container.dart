import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;
  final bool noPadding;
  final bool fillScreen;
  final Color color;

  const ScreenContainer(
      {super.key,
      required this.child,
      this.color = AppColors.backColor,
      this.fillScreen = true,
      this.noPadding = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          (fillScreen)
              ? Positioned.fill(
                  child: Container(
                    color: color,
                    padding: noPadding
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(
                            left: Dimens.spacing_16,
                            right: Dimens.spacing_16,
                            top: Dimens.spacing_16,
                            bottom: Dimens.spacing_16,
                          ),
                    child: child,
                  ),
                )
              : Container(
                  color: color,
                  padding: noPadding
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(
                          left: Dimens.spacing_16,
                          right: Dimens.spacing_16,
                          top: Dimens.spacing_16,
                          bottom: Dimens.spacing_16,
                        ),
                  child: child,
                ),
        ],
      ),
    );
  }
}
