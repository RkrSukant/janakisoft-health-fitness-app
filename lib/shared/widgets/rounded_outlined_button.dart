import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';

class RoundedOutlinedButton extends StatefulWidget {
  final String text;
  final Color buttonColor;
  final Color? backgroundColor;
  final bool disable;
  final VoidCallback onPress;

  const RoundedOutlinedButton({
    super.key,
    required this.text,
    this.disable = false,
    required this.onPress,
    this.buttonColor = AppColors.primaryColor,
    this.backgroundColor
  });

  @override
  State<RoundedOutlinedButton> createState() => _RoundedOutlinedButtonState();
}

class _RoundedOutlinedButtonState extends State<RoundedOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.spacing_12)),
          side: BorderSide(
            width: 1.0,
            color: widget.buttonColor,
            style: BorderStyle.solid,
          ),
          backgroundColor: widget.backgroundColor
        ),
        onPressed: widget.disable ? null : widget.onPress,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacing_16),
          child: Text(
            widget.text,
            style: textFFFFFFs16w600.copyWith(color: widget.buttonColor),
          ),
        ),
      ),
    );
  }
}
