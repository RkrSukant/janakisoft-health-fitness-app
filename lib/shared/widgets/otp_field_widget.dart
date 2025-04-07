import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';

class OtpFieldWidget extends StatelessWidget {
  final int length;
  final bool fillWithWhite;
  final Function validator;
  final Function onComplete;

  const OtpFieldWidget(
      {Key? key,
        required this.length,
        required this.validator,
        required this.onComplete,
        this.fillWithWhite=true,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: length,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      pinContentAlignment: Alignment.center,
      validator: (input)=>validator(input),
      keyboardType: TextInputType.number,
      onCompleted: (input)=>onComplete(input),
      defaultPinTheme: PinTheme(
          height: Dimens.spacing_48,
          width: Dimens.spacing_48,
          textStyle: text1F2024s24w400,
          decoration: BoxDecoration(
            color: (fillWithWhite)
                ? AppColors.whiteFFFFFF
                : AppColors.blue32e0e7,
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.circular(Dimens.spacing_12),
            border: Border.all(
                color: AppColors.greyB0BAC9
            ),
          )
      ),
      focusedPinTheme: PinTheme(
          height: Dimens.spacing_48,
          width: Dimens.spacing_48,
          textStyle: text1F2024s24w400,
          decoration: BoxDecoration(
            color: (fillWithWhite)
                ? AppColors.whiteFFFFFF
                : AppColors.blue32e0e7,
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.circular(Dimens.spacing_12),
            border: Border.all(
              color: AppColors.blue006FFDD,
            ),
          )
      ),
      errorPinTheme: PinTheme(
          height: Dimens.spacing_48,
          width: Dimens.spacing_48,
          textStyle: text1F2024s24w400,
          decoration: BoxDecoration(
            color: (fillWithWhite)
                ? AppColors.whiteFFFFFF
                : AppColors.blue32e0e7,
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.circular(Dimens.spacing_12),
            border: Border.all(
              color: AppColors.redED3241,
            ),
          )
      ),
    );
  }
}