import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_filled_button.dart';

enum WeightUnit { lbs, kg }

class OnboardingWeightWidget extends StatefulWidget {
  final Function(int weight, String selectedUnit) callback;

  const OnboardingWeightWidget({super.key, required this.callback});

  @override
  State<OnboardingWeightWidget> createState() => _OnboardingWeightWidgetState();
}

class _OnboardingWeightWidgetState extends State<OnboardingWeightWidget> {
  WeightUnit _selectedUnit = WeightUnit.lbs;
  int _selectedWeight = 150;

  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 150);

  int _getMaxValueForUnit(WeightUnit unit) {
    return unit == WeightUnit.kg ? 150 : 331; // 0–149 for kg, 0–330 for lbs
  }

  String get _unitLabel => _selectedUnit == WeightUnit.lbs ? 'lbs' : 'kg';

  @override
  Widget build(BuildContext context) {
    final maxWeight = _getMaxValueForUnit(_selectedUnit);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: Column(
          children: [
            const Text(
              'What is your Weight?',
              style: text1F2024s32w700,
              textAlign: TextAlign.start,
            ),
            addVerticalSpace(Dimens.spacing_8),
            Text(
              '$_selectedWeight $_unitLabel',
              style: text1F2024s24w600,
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: Dimens.spacing_100,
                perspective: 0.005,
                diameterRatio: 2.5,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    _selectedWeight = index;
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    if (index < 0 || index >= maxWeight) return null;

                    final isSelected = index == _selectedWeight;

                    return Container(
                      height: Dimens.spacing_100,
                      width: Dimens.spacing_120,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(Dimens.spacing_16),
                      ),
                      child: Center(
                        child: Text(
                          '$index',
                          style: isSelected
                              ? textFFFFFFs60w600
                              : text1F2024s40w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            addVerticalSpace(Dimens.spacing_16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  isSelected: [
                    _selectedUnit == WeightUnit.lbs,
                    _selectedUnit == WeightUnit.kg
                  ],
                  onPressed: (index) {
                    final newUnit = index == 0 ? WeightUnit.lbs : WeightUnit.kg;
                    if (newUnit != _selectedUnit) {
                      int newValue = _selectedUnit == WeightUnit.kg
                          ? (_selectedWeight * 2.20462).round()
                          : (_selectedWeight / 2.20462).round();
                      final maxVal = _getMaxValueForUnit(newUnit);
                      newValue = newValue.clamp(0, maxVal - 1);

                      setState(() {
                        _selectedUnit = newUnit;
                        _selectedWeight = newValue;
                        _scrollController.jumpToItem(newValue);
                      });
                    }
                  },
                  borderRadius: BorderRadius.circular(Dimens.spacing_16),
                  selectedColor: Colors.white,
                  fillColor: AppColors.primaryColor,
                  color: AppColors.primaryColor,
                  constraints: const BoxConstraints(
                    minHeight: Dimens.spacing_48,
                    minWidth: 120,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.spacing_16,
                        vertical: Dimens.spacing_8,
                      ),
                      child: Text(
                        "lbs",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _selectedUnit == WeightUnit.lbs
                              ? Colors.white
                              : AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.spacing_16,
                        vertical: Dimens.spacing_8,
                      ),
                      child: Text(
                        "kg",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _selectedUnit == WeightUnit.kg
                              ? Colors.white
                              : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            addVerticalSpace(Dimens.spacing_32),
            RoundedFilledButtonWidget(
              text: Strings.continueTxt,
              onPress: () {
                widget.callback(_selectedWeight, _unitLabel);
              },
            ),
          ],
        ),
      ),
    );
  }
}
