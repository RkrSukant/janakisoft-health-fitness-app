import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_filled_button.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';

class OnboardingBloodTypeWidget extends StatefulWidget {
  final Function(String bloodType) callback;

  const OnboardingBloodTypeWidget({super.key, required this.callback});

  @override
  State<OnboardingBloodTypeWidget> createState() =>
      _OnboardingBloodTypeWidgetState();
}

class _OnboardingBloodTypeWidgetState extends State<OnboardingBloodTypeWidget> {
  final List<String> bloodGroups = ['A', 'B', 'AB', 'O'];
  String selectedGroup = 'A';
  String selectedRh = '+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'What is your Blood Type?',
              style: text1F2024s32w700,
            ),
            addVerticalSpace(Dimens.spacing_32),
            ToggleButtons(
              isSelected: bloodGroups.map((e) => e == selectedGroup).toList(),
              onPressed: (index) {
                setState(() {
                  selectedGroup = bloodGroups[index];
                });
              },
              borderRadius: BorderRadius.circular(Dimens.spacing_12),
              selectedColor: Colors.white,
              fillColor: AppColors.primaryColor,
              color: AppColors.primaryColor,
              borderColor: Colors.transparent,
              selectedBorderColor: Colors.transparent,
              constraints: const BoxConstraints(minWidth: 70, minHeight: 48),
              children: bloodGroups
                  .map((group) => Text(
                        group,
                        style: text1F2024s16w600,
                      ))
                  .toList(),
            ),
            addVerticalSpace(Dimens.spacing_32),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: selectedGroup,
                    style: text1F2024s80w700,
                  ),
                  TextSpan(
                    text: selectedRh,
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                      color: selectedRh == '+'
                          ? Colors.redAccent
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(Dimens.spacing_32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRhButton('+', selectedRh == '+'),
                addHorizontalSpace(Dimens.spacing_16),
                _buildRhButton('-', selectedRh == '-'),
              ],
            ),
            const Spacer(),
            RoundedFilledButtonWidget(
              text: Strings.finish,
              onPress: () {
                widget.callback('$selectedGroup$selectedRh');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRhButton(String symbol, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRh = symbol;
        });
      },
      child: Container(
        height: Dimens.spacing_64,
        width: Dimens.spacing_64 * 2,
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(Dimens.spacing_16),
          border: Border.all(
            color: selected ? AppColors.primaryColor : Colors.grey.shade400,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
