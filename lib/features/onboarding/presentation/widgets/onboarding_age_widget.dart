import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_filled_button.dart';

class OnboardingAgeWidget extends StatefulWidget {
  final Function(int) callback;

  const OnboardingAgeWidget({super.key, required this.callback});

  @override
  State<OnboardingAgeWidget> createState() => _OnboardingAgeWidgetState();
}

class _OnboardingAgeWidgetState extends State<OnboardingAgeWidget> {
  int _selectedAge = 18;
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 18);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacing_16),
      child: Column(
        children: [
          const Text(
            'What is your age?',
            style: text1F2024s32w700,
            textAlign: TextAlign.start,
          ),
          Expanded(
            child: ListWheelScrollView(
              controller: _scrollController,
              perspective: 0.005,
              diameterRatio: 2.7,
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedAge = index;
                });
              },
              itemExtent: Dimens.spacing_180,
              children: List.generate(
                100,
                (index) => Container(
                  height: Dimens.spacing_180,
                  width: Dimens.spacing_180,
                  decoration: (_selectedAge == index)
                      ? BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimens.spacing_16),
                          color: AppColors.primaryColor)
                      : null,
                  child: Center(
                    child: Text(
                      '$index',
                      style: (_selectedAge == index)
                          ? textFFFFFFs128w600
                          : text1F2024s60w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          addVerticalSpace(Dimens.spacing_48),
          RoundedFilledButtonWidget(
            text: Strings.continueTxt,
            onPress: () {
              widget.callback(_selectedAge);
            },
          ),
        ],
      ),
    );
  }
}
