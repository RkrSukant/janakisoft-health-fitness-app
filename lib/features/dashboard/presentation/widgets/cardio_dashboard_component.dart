import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/dashboard/presentation/widgets/dashboard_common_card_widget.dart';
import 'package:janakisoft_health_fitness_app/routes/app_route.gr.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/strings.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';

class CardioDashboardComponentWidget extends ConsumerStatefulWidget {
  const CardioDashboardComponentWidget({super.key});

  @override
  ConsumerState createState() => _CardioDashboardComponentWidgetState();
}

class _CardioDashboardComponentWidgetState
    extends ConsumerState<CardioDashboardComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushRoute(const CardioMainRoute());
      },
      child: DashboardCommonCardWidget(
        backgroundColor: AppColors.redFA4D5E,
        borderColor: AppColors.redFA4D5E,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    Strings.cardiovascularHealth,
                    style: textFFFFFFs14w500,
                  ),
                ),
                Icon(
                  Icons.monitor_heart,
                  size: Dimens.spacing_16,
                  color: AppColors.whiteFFFFFF,
                )
              ],
            ),
            addVerticalSpace(Dimens.spacing_16),
            AspectRatio(
              aspectRatio: 3.4,
              child: LineChart(mainData()),
            ),
            addVerticalSpace(Dimens.spacing_8),
            RichText(
              text: const TextSpan(
                text: "120",
                style: textFFFFFFs16w600,
                children: [
                  TextSpan(text: " mmHg", style: textFFFFFFs14w500),
                ],
              ),
            ),
            addVerticalSpace(Dimens.spacing_4),
            RichText(
              text: const TextSpan(
                text: "Last Update: ",
                style: textFFFFFFs10w400,
                children: [
                  TextSpan(text: "2nd April", style: textFFFFFFs10w600),
                ],
              ),
            ),
            Visibility(
              child: Column(
                children: [
                  addVerticalSpace(Dimens.spacing_8),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteFFFFFF,
                        elevation: Dimens.spacing_0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.spacing_40)),
                      ),
                      onPressed: (){},
                      child: const Text(
                        Strings.record,
                        style: textFA4D5Es16w600,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      minY: 70,
      maxY: 140,
      gridData: FlGridData(
        drawHorizontalLine: false,
        drawVerticalLine: true,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) => const FlLine(
          color: Colors.white24,
          strokeWidth: 1,
        ),
      ),
      titlesData: const FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 120),
            FlSpot(1, 125),
            FlSpot(2, 118),
            FlSpot(3, 130),
            FlSpot(4, 115),
            FlSpot(5, 122),
            FlSpot(6, 119),
          ],
          isCurved: true,
          color: Colors.white,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          dotData: const FlDotData(show: false),
        ),
      ],
      borderData: FlBorderData(show: false),
    );
  }
}
