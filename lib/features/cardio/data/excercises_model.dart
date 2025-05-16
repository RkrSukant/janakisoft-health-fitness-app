import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final IconData icon;
  final String cardioRating;
  final int caloriesBurned;
  final String lastPerformed;
  final String description;

  Exercise({
    required this.name,
    required this.icon,
    required this.cardioRating,
    required this.caloriesBurned,
    required this.lastPerformed,
    required this.description,
  });
}
