import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/features/onboarding/data/model/onboarding_goal_model.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_filled_button.dart';

class OnboardingGoalsWidget extends StatefulWidget {
  final Function(List<OnboardingGoalModel>) callback;

  const OnboardingGoalsWidget({super.key, required this.callback});

  @override
  State<OnboardingGoalsWidget> createState() => _OnboardingGoalsWidgetState();
}

class _OnboardingGoalsWidgetState extends State<OnboardingGoalsWidget> {
  var goalsList = [
    OnboardingGoalModel(
        goalIcon: Icons.health_and_safety,
        goalText: 'I wanna get Healthy',
        isSelected: false),
    OnboardingGoalModel(
        goalIcon: Icons.monitor_weight_rounded,
        goalText: 'I wanna lose weight',
        isSelected: true),
    OnboardingGoalModel(
        goalIcon: Icons.monitor_rounded,
        goalText: 'I wanna monitor health metrics',
        isSelected: false),
    OnboardingGoalModel(
        goalIcon: Icons.medical_information_rounded,
        goalText: 'I wanna manage meds',
        isSelected: false),
    OnboardingGoalModel(
        goalIcon: Icons.install_mobile,
        goalText: 'Just trying out the app',
        isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacing_16),
      child: Column(
        children: [
          const Text(
            "What are your health goals with the app?",
            textAlign: TextAlign.start,
            style: text1F2024s32w700,
          ),
          addVerticalSpace(Dimens.spacing_32),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(
                    top: Dimens.spacing_16, bottom: Dimens.spacing_32),
                itemCount: goalsList.length,
                separatorBuilder: (context, index) {
                  return addVerticalSpace(Dimens.spacing_16);
                },
                itemBuilder: (context, index) {
                  return healthGoalListItemWidget(goalsList[index], index);
                }),
          ),
          RoundedFilledButtonWidget(
            text: Strings.continueTxt,
            onPress: () {
              widget.callback(goalsList.where(
                (element) {
                  return element.isSelected;
                },
              ).toList());
            },
          )
        ],
      ),
    );
  }

  Widget healthGoalListItemWidget(OnboardingGoalModel goal, int index) {
    return GestureDetector(
      onTap: () {
        goal.isSelected = !goal.isSelected;
        goalsList[index] = goal;
        setState(() {});
      },
      child: AnimatedContainer(
          decoration: BoxDecoration(
            color: goal.isSelected
                ? AppColors.primaryColor
                : AppColors.whiteFFFFFF,
            borderRadius: BorderRadius.circular(Dimens.spacing_16),
          ),
          duration: Consts.animationDuration,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.spacing_12, horizontal: Dimens.spacing_16),
            child: Row(
              children: [
                Icon(
                  goal.goalIcon,
                  color: goal.isSelected
                      ? AppColors.whiteFFFFFF
                      : AppColors.primaryColor,
                  size: Dimens.spacing_24,
                ),
                addHorizontalSpace(Dimens.spacing_8),
                Expanded(
                  child: Text(
                    goal.goalText,
                    style:
                        goal.isSelected ? textFFFFFFs14w500 : text1F2024s14w500,
                  ),
                ),
                addHorizontalSpace(Dimens.spacing_4),
                Checkbox(
                  side: const BorderSide(
                      color: AppColors.primaryColor, width: Dimens.spacing_2),
                  splashRadius: Dimens.spacing_16,
                  activeColor: AppColors.whiteFFFFFF,
                  checkColor: AppColors.primaryColor,
                  value: goal.isSelected,
                  onChanged: (value) {},
                )
              ],
            ),
          )),
    );
  }
}
