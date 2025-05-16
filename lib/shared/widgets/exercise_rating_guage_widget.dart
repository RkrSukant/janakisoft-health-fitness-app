import 'dart:math';

import 'package:flutter/material.dart';

class CardioRatingGauge extends StatelessWidget {
  final String rating;
  final double size;

  const CardioRatingGauge({
    super.key,
    required this.rating,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    // Define colors for each rating level
    final ratingColors = {
      'Excellent': Colors.green,
      'Great': Colors.lightGreen,
      'Good': Colors.blue,
      'Fair': Colors.orange,
      'Poor': Colors.red,
    };

    // Define angle ranges for each rating (in radians)
    final ratingAngles = {
      'Excellent': 0.6,
      'Great': 0.5,
      'Good': 0.4,
      'Fair': 0.3,
      'Poor': 0.2,
    };

    final color = ratingColors[rating] ?? Colors.grey;
    final angle = ratingAngles[rating] ?? 0.3;

    return SizedBox(
      width: size,
      height: size / 2, // Semi-circle
      child: Stack(
        children: [
          // Background semi-circle
          CustomPaint(
            painter: _GaugePainter(
              strokeWidth: 4,
              color: Colors.grey[300]!,
              startAngle: -pi,
              sweepAngle: pi,
              fill: false,
            ),
          ),
          // Colored rating indicator
          CustomPaint(
            painter: _GaugePainter(
              strokeWidth: 6,
              color: color,
              startAngle: -pi,
              sweepAngle: angle * pi,
              fill: false,
            ),
          ),
          // Rating text
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                rating[0], // First letter only
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double startAngle;
  final double sweepAngle;
  final bool fill;

  _GaugePainter({
    required this.strokeWidth,
    required this.color,
    required this.startAngle,
    required this.sweepAngle,
    required this.fill,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = fill ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width / 2,
    );

    canvas.drawArc(rect, startAngle, sweepAngle, fill, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}