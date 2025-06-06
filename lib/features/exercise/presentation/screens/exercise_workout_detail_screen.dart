import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/exercise/data/model/workout_model.dart';
import 'package:janakisoft_health_fitness_app/shared/widgets/appbar.dart';

@RoutePage()
class ExerciseWorkoutDetailScreen extends ConsumerStatefulWidget {
  final WorkoutModel workoutModel;
  const ExerciseWorkoutDetailScreen({super.key, required this.workoutModel});

  @override
  ConsumerState createState() => _ExerciseWorkoutDetailScreenState();
}

class _ExerciseWorkoutDetailScreenState extends ConsumerState<ExerciseWorkoutDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Image.asset(widget.workoutModel.image)
        ],
      ),
    );
  }
}
