import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';

class DashboardCommonCardWidget extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final Widget child;

  const DashboardCommonCardWidget(
      {super.key,
      this.borderColor = AppColors.greyE8E9F1,
      this.backgroundColor = AppColors.whiteFFFFFF,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Dimens.spacing_16),
        border: Border.all(width: Dimens.spacing_0_5, color: borderColor),
      ),
      duration: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: child,
      ),
    );
  }
}
