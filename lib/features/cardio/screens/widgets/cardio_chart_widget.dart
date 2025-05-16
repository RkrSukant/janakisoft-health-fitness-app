import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HealthChart extends StatefulWidget {
  final String title;
  final Color chartColor;
  final List<FlSpot> dataPoints;
  final double minY;
  final double maxY;

  const HealthChart({
    super.key,
    required this.title,
    required this.chartColor,
    required this.dataPoints,
    required this.minY,
    required this.maxY,
  });

  @override
  State<HealthChart> createState() => _HealthChartState();
}

class _HealthChartState extends State<HealthChart> {
  String selectedFilter = 'Last 7 Days';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: widget.chartColor.withOpacity(0.05), // light background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: Title and Filter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: selectedFilter,
                underline: const SizedBox(), // Remove underline
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: ['Last 7 Days', 'This Month', 'Past 3 Months']
                    .map((filter) => DropdownMenuItem(
                  value: filter,
                  child: Text(filter),
                ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedFilter = value;
                      // TODO: Handle changing chart data based on selected filter
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: _buildLineChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        minY: widget.minY,
        maxY: widget.maxY,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: (widget.maxY - widget.minY) / 5,
              reservedSize: 36,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 36,
              getTitlesWidget: (value, meta) {
                final now = DateTime.now();
                int day = now.day - 6 + value.toInt();

                if (value.toInt() == 3) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _monthName(now.month),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$day',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                } else {
                  return Text(
                    '$day',
                    style: const TextStyle(fontSize: 12),
                  );
                }
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: widget.dataPoints,
            isCurved: true,
            color: widget.chartColor,
            barWidth: 4,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: widget.chartColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 600),
    );
  }

  String _monthName(int monthNumber) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[monthNumber];
  }
}
