import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ExerciseWorkoutDetailScreen extends ConsumerStatefulWidget {
  const ExerciseWorkoutDetailScreen({super.key});

  @override
  ConsumerState createState() => _ExerciseWorkoutDetailScreenState();
}

class _ExerciseWorkoutDetailScreenState extends ConsumerState<ExerciseWorkoutDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
