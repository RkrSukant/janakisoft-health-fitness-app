import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/onboarding/presentation/widgets/onboarding_age_widget.dart';
import 'package:janakisoft_health_fitness_app/features/onboarding/presentation/widgets/onboarding_gender_widget.dart';
import 'package:janakisoft_health_fitness_app/features/onboarding/presentation/widgets/onboarding_goals_widget.dart';
import 'package:janakisoft_health_fitness_app/features/onboarding/presentation/widgets/onboarding_weight_widget.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/constants.dart';

@RoutePage()
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  List<Widget> onboardingPages = [];
  int currentPage = 0;
  double onboardingProgress = 0.0;
  ValueNotifier<double> progressNotifier = ValueNotifier(0.0);
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    onboardingPages = [
      OnboardingGoalsWidget(
        callback: (goalsList) {
          _pageController.nextPage(
              duration: Consts.animationDuration, curve: Curves.easeInOut);
        },
      ),
      OnboardingGenderWidget(callback: (gender) {
        _pageController.nextPage(
            duration: Consts.animationDuration, curve: Curves.easeInOut);
        debugPrint(gender.genderName);
      }),
      OnboardingAgeWidget(
        callback: (selectedAge) {
          _pageController.nextPage(
              duration: Consts.animationDuration, curve: Curves.easeInOut);
          debugPrint(selectedAge.toString());
        },
      ),
      OnboardingWeightWidget(callback: (weight, unit) {
        _pageController.nextPage(
            duration: Consts.animationDuration, curve: Curves.easeInOut);
        debugPrint(weight.toString());
      },)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: onboardingPages,
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: AnimatedBuilder(
        animation: progressNotifier,
        builder: (context, child) {
          return LinearProgressIndicator(
            value: progressNotifier.value,
            backgroundColor: AppColors.greyB0BAC9,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          );
        },
      ),
    );
  }
}
