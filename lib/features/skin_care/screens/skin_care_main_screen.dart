import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/image_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';

@RoutePage()
class SkinCareMainScreen extends ConsumerStatefulWidget {
  const SkinCareMainScreen({super.key});

  @override
  ConsumerState createState() => _SkinCareMainScreenState();
}

class _SkinCareMainScreenState extends ConsumerState<SkinCareMainScreen> {
  final List<String> days = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

  final List<double> skinScores = [
    85, 82, 88, 90, 87, 92, 85
  ];

  final List<HealthTip> healthTips = [
    HealthTip(
      title: "Cleanse Daily",
      icon: Icons.clean_hands,
      description: "Wash your face twice daily to remove dirt and excess oil.",
    ),
    HealthTip(
      title: "Stay Hydrated",
      icon: Icons.water_drop,
      description: "Drink at least 8 glasses of water daily for glowing skin.",
    ),
    HealthTip(
      title: "Use Sunscreen",
      icon: Icons.wb_sunny_outlined,
      description: "Apply SPF 30+ sunscreen daily to prevent premature aging.",
    ),
    HealthTip(
      title: "Healthy Diet",
      icon: Icons.fastfood_outlined,
      description: "Eat fruits and vegetables rich in antioxidants for skin health.",
    ),
    HealthTip(
      title: "Get Enough Sleep",
      icon: Icons.bedtime_outlined,
      description: "7-8 hours of sleep helps skin repair and regenerate.",
    ),
  ];

  final List<SkinRoutine> dailyRoutines = [
    SkinRoutine(
        name: "Morning Routine",
        steps: [
          "Gentle cleanser",
          "Vitamin C serum",
          "Moisturizer",
          "Sunscreen SPF 30+"
        ],
        time: "7:00 AM"
    ),
    SkinRoutine(
        name: "Evening Routine",
        steps: [
          "Makeup remover",
          "Cleanser",
          "Exfoliate (2-3x/week)",
          "Retinol serum",
          "Night cream"
        ],
        time: "9:00 PM"
    ),
  ];

  final List<Exercise> yogaExercises = [
    Exercise(
      name: "Kapalbhati",
      icon: Icons.self_improvement,
      benefit: "Improves blood circulation",
      duration: "5 min",
      description: "Powerful breathing exercise that detoxifies and brings glow to skin.",
    ),
    Exercise(
      name: "Sarvangasana",
      icon: Icons.self_improvement,
      benefit: "Reverses aging",
      duration: "3 min",
      description: "Shoulder stand pose that increases blood flow to face.",
    ),
    Exercise(
      name: "Halasana",
      icon: Icons.self_improvement,
      benefit: "Reduces acne",
      duration: "2 min",
      description: "Plow pose helps regulate hormones and reduce breakouts.",
    ),
  ];

  int _currentTipIndex = 0;
  final PageController _tipController = PageController();
  Timer? _tipScrollTimer;

  int _currentExerciseIndex = 0;
  final PageController _exerciseController = PageController();

  @override
  void initState() {
    super.initState();
    _tipScrollTimer = Timer.periodic(const Duration(seconds: 6), (_) {
      final next = (_currentTipIndex + 1) % healthTips.length;
      _tipController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() => _currentTipIndex = next);
    });
  }

  @override
  void dispose() {
    _tipController.dispose();
    _exerciseController.dispose();
    _tipScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.purple9C27B0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteFFFFFF,
              size: Dimens.spacing_32,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [AppColors.purple9C27B0, AppColors.purpleBA68C8],
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.only(
              bottom: Dimens.spacing_16,
              left: Dimens.spacing_16,
              right: Dimens.spacing_16,
            ),
            children: [
              // _headerWidget(),
              // addVerticalSpace(Dimens.spacing_16),
              // _chartWidget(),
              // addVerticalSpace(Dimens.spacing_16),
              Text(
                "Skin Health Tips",
                style: textFFFFFFs24w600,
              ),
              addVerticalSpace(Dimens.spacing_8),
              _healthTipWidget(),
              addVerticalSpace(Dimens.spacing_16),
              Text(
                "Daily Skin Care Routines",
                style: textFFFFFFs24w600,
              ),
              addVerticalSpace(Dimens.spacing_8),
              _routineWidget(),
              addVerticalSpace(Dimens.spacing_16),
              Text(
                "Yoga for Skin Health",
                style: textFFFFFFs24w600,
              ),
              addVerticalSpace(Dimens.spacing_8),
              _yogaWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.spacing_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "88/100",
                  style: textFFFFFFs32w600,
                ),
                const Text(
                  "Skin Health Score",
                  style: textFFFFFFs14w500,
                ),
                addVerticalSpace(Dimens.spacing_16),
                const Text(
                  "Your skin is in good condition",
                  style: textFFFFFFs16w600,
                )
              ],
            ),
          ),
        ),
        addHorizontalSpace(Dimens.spacing_8),
        Expanded(
          flex: 2,
          // child: Image.asset(
          //   ImageConstants.icSkinCare, // Replace with your skin care image
          //   fit: BoxFit.contain,
          // ),
          child: Container(),
        ),
      ],
    );
  }

  Widget _chartWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFFFFO75,
        borderRadius: BorderRadius.circular(Dimens.spacing_16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Weekly Skin Health Progress",
              style: text1F2024s12w500,
            ),
            addVerticalSpace(Dimens.spacing_8),
            const Divider(
              color: AppColors.black1F2024O15,
              height: Dimens.spacing_0_5,
            ),
            addVerticalSpace(Dimens.spacing_16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minY: 70,
                  maxY: 100,
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 && value.toInt() < days.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                days[value.toInt()],
                                style: text1F2024s12w600,
                              ),
                            );
                          }
                          return const Text('');
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: text1F2024s12w600,
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: skinScores.asMap().entries.map((entry) {
                        return FlSpot(entry.key.toDouble(), entry.value);
                      }).toList(),
                      isCurved: true,
                      color: AppColors.purple9C27B0,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.purple9C27B0.withOpacity(0.2),
                      ),
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _healthTipWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFFFFO75,
        borderRadius: BorderRadius.circular(Dimens.spacing_16),
      ),
      padding: const EdgeInsets.all(Dimens.spacing_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            child: PageView.builder(
              controller: _tipController,
              itemCount: healthTips.length,
              onPageChanged: (index) =>
                  setState(() => _currentTipIndex = index),
              itemBuilder: (context, index) {
                final tip = healthTips[index];
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(tip.icon,
                            color: AppColors.black1F2024,
                            size: Dimens.spacing_32),
                        addHorizontalSpace(Dimens.spacing_12),
                        Text(tip.title, style: text1F2024s16w600),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: Dimens.spacing_12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addVerticalSpace(Dimens.spacing_12),
                          Text(
                            tip.description,
                            style: const TextStyle(color: AppColors.black1F2024),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          addVerticalSpace(Dimens.spacing_8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              healthTips.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin:
                const EdgeInsets.symmetric(horizontal: Dimens.spacing_4),
                width: Dimens.spacing_8,
                height: Dimens.spacing_8,
                decoration: BoxDecoration(
                  color: _currentTipIndex == index
                      ? AppColors.black1F2024
                      : AppColors.black1F2024O40,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _routineWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFFFFO75,
        borderRadius: BorderRadius.circular(Dimens.spacing_16),
      ),
      padding: const EdgeInsets.all(Dimens.spacing_16),
      child: Column(
        children: dailyRoutines.map((routine) {
          return Padding(
            padding: const EdgeInsets.only(bottom: Dimens.spacing_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      routine.name,
                      style: text1F2024s16w700,
                    ),
                    Text(
                      routine.time,
                      style: text1F2024s14w500,
                    ),
                  ],
                ),
                addVerticalSpace(Dimens.spacing_8),
                ...routine.steps.map((step) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.spacing_8,
                      bottom: Dimens.spacing_4,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColors.black1F2024,
                        ),
                        addHorizontalSpace(Dimens.spacing_8),
                        Text(
                          step,
                          style: text1F2024s14w500,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _yogaWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFFFFO75,
        borderRadius: BorderRadius.circular(Dimens.spacing_16),
      ),
      padding: const EdgeInsets.all(Dimens.spacing_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              controller: _exerciseController,
              itemCount: yogaExercises.length,
              onPageChanged: (index) =>
                  setState(() => _currentExerciseIndex = index),
              itemBuilder: (context, index) {
                final ex = yogaExercises[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(ex.icon,
                            size: Dimens.spacing_36,
                            color: AppColors.black1F2024),
                        addHorizontalSpace(Dimens.spacing_16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ex.name,
                                style: text1F2024s16w700,
                              ),
                              addVerticalSpace(Dimens.spacing_4),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ex.benefit,
                                    style: text1F2024s12w500,
                                  ),
                                  Text(
                                    ex.duration,
                                    style: text1F2024s12w700,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(Dimens.spacing_12),
                    Text(
                      ex.description,
                      style: text1F2024s14w500,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
          ),
          addVerticalSpace(Dimens.spacing_16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              yogaExercises.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin:
                const EdgeInsets.symmetric(horizontal: Dimens.spacing_4),
                width: Dimens.spacing_8,
                height: Dimens.spacing_8,
                decoration: BoxDecoration(
                  color: _currentExerciseIndex == index
                      ? AppColors.black1F2024
                      : AppColors.black1F2024O40,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HealthTip {
  final String title;
  final IconData icon;
  final String description;

  HealthTip({
    required this.title,
    required this.icon,
    required this.description,
  });
}

class SkinRoutine {
  final String name;
  final List<String> steps;
  final String time;

  SkinRoutine({
    required this.name,
    required this.steps,
    required this.time,
  });
}

class Exercise {
  final String name;
  final IconData icon;
  final String benefit;
  final String duration;
  final String description;

  Exercise({
    required this.name,
    required this.icon,
    required this.benefit,
    required this.duration,
    required this.description,
  });
}