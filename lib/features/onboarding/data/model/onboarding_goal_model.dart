import 'package:flutter/material.dart';

class OnboardingGoalModel {
  IconData goalIcon;
  String goalText;
  bool isSelected;

  OnboardingGoalModel(
      {required this.goalIcon,
      required this.goalText,
      required this.isSelected});
}
