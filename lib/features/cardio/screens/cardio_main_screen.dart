import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/cardio/data/excercises_model.dart';
import 'package:janakisoft_health_fitness_app/features/cardio/data/health_tips_model.dart';
import 'package:janakisoft_health_fitness_app/routes/route_util.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/image_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/exercise_rating_guage_widget.dart';

enum HealthTab {
  bloodPressure,
  sugarLevel,
  heartRate,
}

extension HealthTabExtension on HealthTab {
  String get title {
    switch (this) {
      case HealthTab.bloodPressure:
        return 'Blood Pressure';
      case HealthTab.sugarLevel:
        return 'Sugar Level';
      case HealthTab.heartRate:
        return 'Heart Rate';
    }
  }

  Color get primaryColor {
    switch (this) {
      case HealthTab.bloodPressure:
        return AppColors.redFF727C;
      case HealthTab.sugarLevel:
        return AppColors.blue006FFD;
      case HealthTab.heartRate:
        return AppColors.green00C896;
    }
  }

  Color get secondaryColor {
    switch (this) {
      case HealthTab.bloodPressure:
        return AppColors.redFF949D;
      case HealthTab.sugarLevel:
        return AppColors.blue4DA6FF;
      case HealthTab.heartRate:
        return AppColors.green4CE5B1;
    }
  }

  String get unit {
    switch (this) {
      case HealthTab.bloodPressure:
        return Strings.mmHg;
      case HealthTab.sugarLevel:
        return 'mg/dL';
      case HealthTab.heartRate:
        return 'bpm';
    }
  }

  String get currentValue {
    switch (this) {
      case HealthTab.bloodPressure:
        return '80/120';
      case HealthTab.sugarLevel:
        return '90';
      case HealthTab.heartRate:
        return '72';
    }
  }

  String get statusMessage {
    switch (this) {
      case HealthTab.bloodPressure:
        return Strings.bloodPressureInHealthyRange;
      case HealthTab.sugarLevel:
        return 'Normal glucose level';
      case HealthTab.heartRate:
        return 'Resting heart rate is optimal';
    }
  }

  String get chartTitle {
    switch (this) {
      case HealthTab.bloodPressure:
        return Strings.bloodPressureInHealthyRange15Days;
      case HealthTab.sugarLevel:
        return 'Glucose levels over last 15 days';
      case HealthTab.heartRate:
        return 'Heart rate trends over last 15 days';
    }
  }
}

@RoutePage()
class CardioMainScreen extends ConsumerStatefulWidget {
  const CardioMainScreen({super.key});

  @override
  ConsumerState createState() => _CardioMainScreenState();
}

class _CardioMainScreenState extends ConsumerState<CardioMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  HealthTab _currentTab = HealthTab.bloodPressure;

  final List<String> days = [
    'Apr 1',
    'Apr 2',
    'Apr 3',
    'Apr 4',
    'Apr 5',
    'Apr 6',
    'Apr 7',
    'Apr 8',
    'Apr 9',
    'Apr 10',
    'Apr 11',
    'Apr 12',
    'Apr 13',
    'Apr 14',
    'Apr 15',
  ];

  final List<List<double>> pressures = [
    [120, 80],
    [125, 82],
    [118, 78],
    [130, 85],
    [110, 75],
    [122, 81],
    [127, 83],
    [119, 79],
    [131, 86],
    [115, 77],
    [121, 80],
    [124, 82],
    [117, 78],
    [129, 84],
    [112, 76],
  ];

  final List<double> sugarLevels = [
    92,
    88,
    95,
    102,
    89,
    91,
    97,
    93,
    105,
    90,
    94,
    98,
    96,
    100,
    92
  ];

  final List<double> heartRates = [
    72,
    75,
    70,
    68,
    74,
    76,
    71,
    69,
    73,
    70,
    72,
    74,
    71,
    75,
    70
  ];

  final List<HealthTip> healthTips = [
    HealthTip(
      title: "Stay Hydrated",
      icon: Icons.water_drop_outlined,
      description:
          "Drinking enough water helps maintain blood pressure and cardiovascular health.",
    ),
    HealthTip(
      title: "Daily Exercise",
      icon: Icons.fitness_center,
      description:
          "Regular workouts strengthen your heart and improve circulation.",
    ),
    HealthTip(
      title: "Eat Greens",
      icon: Icons.eco,
      description:
          "Leafy vegetables are rich in nutrients and lower your heart disease risk.",
    ),
    HealthTip(
      title: "Quit Smoking",
      icon: Icons.smoke_free,
      description:
          "Quitting reduces risk of stroke and heart attacks significantly.",
    ),
    HealthTip(
      title: "Sleep Enough",
      icon: Icons.bedtime,
      description:
          "7–9 hours of sleep lowers stress and keeps the heart healthy.",
    ),
  ];
  int _currentTipIndex = 0;
  final PageController _tipController = PageController();
  Timer? _tipScrollTimer;

  final List<Exercise> exercises = [
    Exercise(
      name: "Running",
      icon: Icons.directions_run,
      cardioRating: "Excellent",
      caloriesBurned: 300,
      lastPerformed: "2 days ago",
      description: "Improves cardiovascular endurance significantly.",
    ),
    Exercise(
      name: "Jump Rope",
      icon: Icons.sports_kabaddi,
      cardioRating: "High",
      caloriesBurned: 250,
      lastPerformed: "5 days ago",
      description: "Quick way to raise your heart rate and burn fat.",
    ),
    Exercise(
      name: "Cycling",
      icon: Icons.directions_bike,
      cardioRating: "Good",
      caloriesBurned: 280,
      lastPerformed: "Yesterday",
      description: "Enhances leg strength and aerobic capacity.",
    ),
  ];

  int _currentExerciseIndex = 0;
  final PageController _exerciseController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

    _tipScrollTimer = Timer.periodic(const Duration(seconds: 6), (_) {
      final next = (_currentTipIndex + 1) % healthTips.length;
      _tipController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() => _currentTipIndex = next);
    });
    
    _exerciseController.addListener(() {
      setState(() {
        _currentExerciseIndex = _exerciseController.page?.round() ?? 0;
      });
    });
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentTab = HealthTab.values[_tabController.index];
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tipController.dispose();
    _exerciseController.dispose();
    _tipScrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: _currentTab.primaryColor,
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteFFFFFF,
              size: Dimens.spacing_32,
            ),
          ),
          title: Text(
            _currentTab.title,
            style: textFFFFFFs24w600,
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Blood Pressure'),
              Tab(text: 'Sugar Level'),
              Tab(text: 'Heart Rate'),
            ],
            indicatorColor: AppColors.whiteFFFFFF,
            labelColor: AppColors.whiteFFFFFF,
            unselectedLabelColor: AppColors.whiteFFFFFFO70,
            onTap: (index) {
              setState(() {
                _currentTab = HealthTab.values[index];
              });
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [_currentTab.primaryColor, _currentTab.secondaryColor],
            ),
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTabContent(HealthTab.bloodPressure),
              _buildTabContent(HealthTab.sugarLevel),
              _buildTabContent(HealthTab.heartRate),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(HealthTab tab) {
    return ListView(
      padding: const EdgeInsets.only(
        bottom: Dimens.spacing_16,
        left: Dimens.spacing_16,
        right: Dimens.spacing_16,
      ),
      children: [
        _headerWidget(tab),
        addVerticalSpace(Dimens.spacing_16),
        _chartWidget(tab),
        addVerticalSpace(Dimens.spacing_16),
        Text(
          "Health Tips",
          style: textFFFFFFs24w600,
        ),
        addVerticalSpace(Dimens.spacing_8),
        _healthTipWidget(),
        addVerticalSpace(Dimens.spacing_16),
        Text(
          "Exercises",
          style: textFFFFFFs24w600,
        ),
        addVerticalSpace(Dimens.spacing_8),
        _exerciseWidget(),
      ],
    );
  }

  Widget _headerWidget(HealthTab tab) {
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
                Text(
                  tab.currentValue,
                  style: textFFFFFFs32w600,
                ),
                Text(
                  tab.unit,
                  style: textFFFFFFs14w500,
                ),
                addVerticalSpace(Dimens.spacing_16),
                Text(
                  tab.statusMessage,
                  style: textFFFFFFs16w600,
                )
              ],
            ),
          ),
        ),
        addHorizontalSpace(Dimens.spacing_8),
        Expanded(
          flex: 2,
          child: Image.asset(
            tab == HealthTab.bloodPressure
                ? ImageConstants.icHeartNormal
                : tab == HealthTab.sugarLevel
                    ? ImageConstants
                        .icHeartNormal // Replace with your sugar level image
                    : ImageConstants
                        .icHeartNormal, // Replace with your heart rate image
          ),
        ),
      ],
    );
  }

  Widget _chartWidget(HealthTab tab) {
    double groupWidth = 64;

    List<double> values = [];
    double maxValue = 0;
    double minValue = 0;

    switch (tab) {
      case HealthTab.bloodPressure:
        values = pressures.expand((pair) => pair).toList();
        maxValue = values.reduce((a, b) => a > b ? a : b) + 15;
        minValue = 60;
        if (maxValue < 140) maxValue = 140;
        break;
      case HealthTab.sugarLevel:
        values = sugarLevels;
        maxValue = values.reduce((a, b) => a > b ? a : b) + 20;
        minValue = 70;
        if (maxValue < 120) maxValue = 120;
        break;
      case HealthTab.heartRate:
        values = heartRates;
        maxValue = values.reduce((a, b) => a > b ? a : b) + 15;
        minValue = 60;
        if (maxValue < 90) maxValue = 90;
        break;
    }

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
            Text(
              tab.chartTitle,
              style: text1F2024s12w500,
            ),
            addVerticalSpace(Dimens.spacing_8),
            const Divider(
              color: AppColors.black1F2024O15,
              height: Dimens.spacing_0_5,
            ),
            addVerticalSpace(Dimens.spacing_16),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 200,
                maxHeight: 240,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: days.length * groupWidth,
                  child: BarChart(
                    BarChartData(
                      borderData: FlBorderData(show: false),
                      alignment: BarChartAlignment.spaceAround,
                      maxY: maxValue,
                      minY: minValue,
                      gridData: FlGridData(
                        drawHorizontalLine: true,
                        horizontalInterval: 10,
                        getDrawingHorizontalLine: (value) {
                          if (tab == HealthTab.bloodPressure) {
                            if (value == 120 || value == 80) {
                              return FlLine(
                                color: (value == 120)
                                    ? AppColors.redC51523
                                    : AppColors.blue006FFD,
                                strokeWidth: 1,
                                dashArray: [5, 5],
                              );
                            }
                          } else if (tab == HealthTab.sugarLevel &&
                              value == 100) {
                            return FlLine(
                              color: AppColors.blue006FFD,
                              strokeWidth: 1,
                              dashArray: [5, 5],
                            );
                          } else if (tab == HealthTab.heartRate &&
                              value == 72) {
                            return FlLine(
                              color: AppColors.green00C896,
                              strokeWidth: 1,
                              dashArray: [5, 5],
                            );
                          }
                          return const FlLine(strokeWidth: Dimens.spacing_0);
                        },
                        drawVerticalLine: false,
                      ),
                      barTouchData: BarTouchData(enabled: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              int index = value.toInt();
                              if (index >= 0 && index < days.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: Dimens.spacing_4),
                                  child: Text(
                                    days[index],
                                    style: text1F2024s12w600,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: Dimens.spacing_40,
                            getTitlesWidget: (value, meta) {
                              int index = value.toInt();
                              if (index >= 0 && index < days.length) {
                                if (tab == HealthTab.bloodPressure) {
                                  final systolic = pressures[index][0];
                                  final diastolic = pressures[index][1];
                                  return Column(
                                    children: [
                                      Text(
                                        '${systolic.toInt()}',
                                        style: text1F2024s12w600,
                                      ),
                                      Text(
                                        '${diastolic.toInt()}',
                                        style: text1F2024s12w600,
                                      ),
                                    ],
                                  );
                                } else {
                                  final val = tab == HealthTab.sugarLevel
                                      ? sugarLevels[index]
                                      : heartRates[index];
                                  return Text(
                                    '${val.toInt()}',
                                    style: text1F2024s12w600,
                                  );
                                }
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      barGroups: List.generate(days.length, (index) {
                        if (tab == HealthTab.bloodPressure) {
                          double systolic = pressures[index][0];
                          double diastolic = pressures[index][1];

                          return BarChartGroupData(
                            x: index,
                            barsSpace: Dimens.spacing_8,
                            barRods: [
                              BarChartRodData(
                                toY: systolic,
                                width: 20,
                                color: Colors.redAccent,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8)),
                              ),
                              BarChartRodData(
                                toY: diastolic,
                                width: 20,
                                color: Colors.lightBlueAccent,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8)),
                              ),
                            ],
                          );
                        } else {
                          double value = tab == HealthTab.sugarLevel
                              ? sugarLevels[index]
                              : heartRates[index];

                          return BarChartGroupData(
                            x: index,
                            barRods: [
                              BarChartRodData(
                                toY: value,
                                width: 20,
                                color: tab == HealthTab.sugarLevel
                                    ? AppColors.blue006FFD
                                    : AppColors.green00C896,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8)),
                              ),
                            ],
                          );
                        }
                      }),
                    ),
                  ),
                ),
              ),
            )
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
                return GestureDetector(
                  onTap: () {
                    // TODO Navigate to detail screen
                  },
                  child: Column(
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
                              style:
                                  const TextStyle(color: AppColors.black1F2024),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              Strings.readMore,
              style: text1F2024s12w600,
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

  // Widget _exerciseWidget() {
  //   return Container(
  //       decoration: BoxDecoration(
  //         color: AppColors.whiteFFFFFFO75,
  //         borderRadius: BorderRadius.circular(Dimens.spacing_16),
  //       ),
  //       padding: const EdgeInsets.all(Dimens.spacing_16),
  //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 Column(
  //                   children: [
  //                     Icon(exercises[0].icon,
  //                         size: Dimens.spacing_36,
  //                         color: AppColors.black1F2024),
  //                     const SizedBox(height: Dimens.spacing_8),
  //                     Text(
  //                       exercises[0].name,
  //                       style: text1F2024s16w700,
  //                     ),
  //                   ],
  //                 ),
  //                 addHorizontalSpace(Dimens.spacing_16),
  //                 Expanded(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Expanded(
  //                         flex: 1,
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             borderRadius:
  //                                 BorderRadius.circular(Dimens.spacing_12),
  //                             color: AppColors.whiteFFFFFFO80,
  //                           ),
  //                           padding: const EdgeInsets.all(Dimens.spacing_8),
  //                           child: Column(
  //                             mainAxisSize: MainAxisSize.max,
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             children: [
  //                               CardioRatingGauge(
  //                                 rating: exercises[0].cardioRating,
  //                                 size: 36,
  //                               ),
  //                               addVerticalSpace(Dimens.spacing_4),
  //                               const Text(
  //                                 "Cardio",
  //                                 style: text1F2024s12w600,
  //                                 textAlign: TextAlign.center,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       addHorizontalSpace(Dimens.spacing_8),
  //                       Expanded(
  //                           flex: 1,
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius:
  //                                   BorderRadius.circular(Dimens.spacing_16),
  //                               color: AppColors.whiteFFFFFF,
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Text(
  //                                   "${exercises[0].caloriesBurned}",
  //                                   style: text1F2024s14w700,
  //                                   textAlign: TextAlign.center,
  //                                 ),
  //                                 const Text(
  //                                   "Calories",
  //                                   style: text1F2024s12w600,
  //                                   textAlign: TextAlign.center,
  //                                 ),
  //                               ],
  //                             ),
  //                           )),
  //                       addHorizontalSpace(Dimens.spacing_8),
  //                       Expanded(
  //                           flex: 1,
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius:
  //                                   BorderRadius.circular(Dimens.spacing_16),
  //                               color: AppColors.whiteFFFFFF,
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 Text(
  //                                   exercises[0].lastPerformed,
  //                                   style: text1F2024s14w700,
  //                                   textAlign: TextAlign.center,
  //                                 ),
  //                                 const Text(
  //                                   "Last",
  //                                   style: text1F2024s12w600,
  //                                   textAlign: TextAlign.center,
  //                                 ),
  //                               ],
  //                             ),
  //                           )),
  //                     ],
  //                   ),
  //                 ),
  //                 addVerticalSpace(Dimens.spacing_12),
  //                 Text(
  //                   exercises[0].description,
  //                   style: text1F2024s14w500,
  //                   maxLines: 4,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ],
  //             ),
  //             addVerticalSpace(Dimens.spacing_16),
  //           ],
  //         ),
  //       ]));
  // }
  Widget _exerciseWidget() {
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
            height: 130,
            child: PageView.builder(
              controller: _exerciseController,
              itemCount: exercises.length,
              onPageChanged: (index) =>
                  setState(() => _currentExerciseIndex = index),
              itemBuilder: (context, index) {
                final ex = exercises[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(ex.icon,
                                size: Dimens.spacing_36,
                                color: AppColors.black1F2024),
                            const SizedBox(height: Dimens.spacing_8),
                            Text(
                              ex.name,
                              style: text1F2024s16w700,
                            ),
                          ],
                        ),
                        addHorizontalSpace(Dimens.spacing_16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Cardio", style: text1F2024s10w500),
                                  Text("Burns", style: text1F2024s10w500),
                                  Text("Last", style: text1F2024s10w500),
                                ],
                              ),
                              addVerticalSpace(Dimens.spacing_4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CardioRatingGauge(
                                    rating: ex.cardioRating,
                                    size: 24,
                                  ),
                                  Text(
                                    "${ex.caloriesBurned} cal",
                                    style: text1F2024s14w700,
                                  ),
                                  Text(
                                    ex.lastPerformed,
                                    style: text1F2024s14w700,
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
                      style: text1F2024s12w500,
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
              exercises.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin:
                    const EdgeInsets.symmetric(horizontal: Dimens.spacing_4),
                width: Dimens.spacing_16 / 2,
                height: Dimens.spacing_16 / 2,
                decoration: BoxDecoration(
                  color: _currentExerciseIndex == index
                      ? AppColors.black1F2024
                      : AppColors.black1F2024O15,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          addVerticalSpace(Dimens.spacing_16),
        ],
      ),
    );
  }

}
