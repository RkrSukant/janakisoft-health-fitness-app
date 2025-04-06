import 'package:flutter/material.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/colors.dart';
import 'package:sukant_flutter_boilerplate/shared/helpers/dimens.dart';

class ForgotPasswordProgressIndicatorWidget extends StatelessWidget {
  final bool isActive;

  const ForgotPasswordProgressIndicatorWidget(
      {super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isActive) ? AppColors.blue006FFD : AppColors.greyE8E9F1,
        borderRadius: BorderRadius.circular(Dimens.spacing_12),
      ),
      height: Dimens.spacing_6,
      width: Dimens.spacing_48,
    );
  }
}
