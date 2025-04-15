import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/routes/app_route.gr.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/image_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_outlined_button.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Stay on Top of Your Health',
      'subtitle':
          'Track your daily habits, monitor your progress, and stay in control of your health—all in one place.',
      'image': ImageConstants.onboardingOne,
    },
    {
      'title': 'Get Expert-Backed Tips',
      'subtitle':
          'Discover actionable tips on nutrition, mental wellness, and fitness—tailored to your goals.',
      'image': ImageConstants.onboardingTwo,
    },
    {
      'title': 'Move better, Feel Stronger',
      'subtitle':
          'Explore a range of guided exercises to build strength, improve flexibility, and boost energy.',
      'image': ImageConstants.onboardingThree,
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // return oldScreen();
    return Scaffold(
      body: Stack(
        children: [
          // Positioned.fill(
          //     child: Image.asset(
          //   ImageConstants.icOnboardingBackground,
          //   fit: BoxFit.fitHeight,
          // )),
          // Positioned.fill(
          //     child: Container(
          //   color: AppColors.whiteFFFFFF.withOpacity(0.2),
          // )),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Padding(
                      padding: const EdgeInsets.all(Dimens.spacing_40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            page['title'],
                            style: textFF962Es32w700,
                            textAlign: TextAlign.center,
                          ),
                          addVerticalSpace(Dimens.spacing_16),
                          Container(
                            width: Dimens.spacing_200,
                            height: Dimens.spacing_200,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              page['image'],
                            ),
                          ),
                          addVerticalSpace(Dimens.spacing_40),

                          // Subtitle
                          Text(
                            page['subtitle'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.spacing_40, vertical: Dimens.spacing_20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: _currentPage == index ? 24 : 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppColors.orangeFF962E
                                : AppColors.orangeFF962E.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    addVerticalSpace(Dimens.spacing_24),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      opacity: (_currentPage == _pages.length - 1) ? 1 : 0,
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: (_currentPage == _pages.length - 1) ? RoundedOutlinedButton(
                          backgroundColor: AppColors.whiteFFFFFF,
                          onPress: () {
                            context.pushRoute(const LoginRoute());
                          },
                          text: Strings.getStarted,
                        ) : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
