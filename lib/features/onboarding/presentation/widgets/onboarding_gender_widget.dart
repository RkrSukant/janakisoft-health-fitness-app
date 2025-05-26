import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:janakisoft_health_fitness_app/features/onboarding/data/model/onboarding_gender_model.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/image_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/rounded_filled_button.dart';
import 'package:path/path.dart';

class OnboardingGenderWidget extends StatefulWidget {
  final Function(OnboardingGenderModel) callback;

  const OnboardingGenderWidget({super.key, required this.callback});

  @override
  State<OnboardingGenderWidget> createState() => _OnboardingGenderWidgetState();
}

class _OnboardingGenderWidgetState extends State<OnboardingGenderWidget> {

  List<OnboardingGenderModel> genderList = [
    OnboardingGenderModel(1, "Male", ImageConstants.icGenderTest),
    OnboardingGenderModel(1, "Female", ImageConstants.icGenderTest),
    OnboardingGenderModel(1, "Prefer not to say", ImageConstants.icGenderTest),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacing_16),
      child: Column(
        children: [
          const Text(
            "What is your Gender?",
            textAlign: TextAlign.start,
            style: text1F2024s32w700,
          ),
          addVerticalSpace(Dimens.spacing_12),
          const Text(
            "Please select your gender for better personalized health experience.",
            style: text1F2024s16w600,
          ),
          addVerticalSpace(Dimens.spacing_16),
          Expanded(
            child: CardSwiper(
              onSwipe: (previousIndex, currentIndex, direction) {
                selectedIndex = currentIndex ?? -1;
                return true;
              },
              cardsCount: genderList.length,
              cardBuilder: (context, index, horizontalOffsetPercentage,
                  verticalOffsetPercentage) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.spacing_16)
                  ),
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimens.spacing_16),
                          ),
                          child: Image.asset(
                            genderList[index].genderContainerImage,
                            fit: BoxFit.fitHeight,
                          )),
                      Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [AppColors.black1F2024O40, Colors.transparent],
                          )),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.spacing_16),
                              child: Text(
                                (genderList[index].genderName !=
                                        "Prefer not to say")
                                    ? "I am a ${genderList[index].genderName}"
                                    : "I'd ${genderList[index].genderName.toLowerCase()}",
                                style: textFFFFFFs32w600,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          addVerticalSpace(Dimens.spacing_48),
          RoundedFilledButtonWidget(
            text: Strings.continueTxt,
            onPress: () {
              widget.callback(genderList[selectedIndex]);
            },
          ),
        ],
      ),
    );
  }
}
