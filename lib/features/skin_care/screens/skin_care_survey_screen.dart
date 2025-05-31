import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/features/skin_care/screens/widget/skin_care_selection_widget.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/image_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/appbar.dart';

@RoutePage()
class SkinCareSurveyScreen extends StatefulWidget {
  const SkinCareSurveyScreen({super.key});

  @override
  State<SkinCareSurveyScreen> createState() => _SkinCareSurveyScreenState();
}

class _SkinCareSurveyScreenState extends State<SkinCareSurveyScreen> {
  final List<String> skinTypes = [
    'Dry',
    'Oily',
    'Normal',
    'Combination',
    'Sensitive'
  ];
  String? selectedSkinType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFFF5F8FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacing_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is your skin type?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2024),
                ),
              ),
              addVerticalSpace(Dimens.spacing_32),
          SkincareSelectionWidget(
            title: "Skin Concerns",
            allowMultiple: true,
            options: [
              SkincareOption(icon: Icons.ac_unit, label: "Acne"),
              SkincareOption(icon: Icons.brightness_3, label: "Dark Circles"),
              SkincareOption(icon: Icons.water_drop, label: "Dryness"),
              SkincareOption(icon: Icons.blur_on, label: "Wrinkles"),
              SkincareOption(icon: Icons.brightness_5, label: "Sun Damage"),
            ],
          ),
          addVerticalSpace(Dimens.spacing_32),
          SkincareSelectionWidget(
            title: "Skin Type",
            allowMultiple: false,
            options: [
              SkincareOption(icon: Icons.ac_unit, label: "Dry"),
              SkincareOption(icon: Icons.brightness_3, label: "Oily"),
              SkincareOption(icon: Icons.water_drop, label: "Dark Patches"),
              SkincareOption(icon: Icons.blur_on, label: "Normal"),
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}
