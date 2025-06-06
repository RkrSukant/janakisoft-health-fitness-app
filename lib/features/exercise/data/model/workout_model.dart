import 'package:janakisoft_health_fitness_app/features/exercise/data/model/exercise_model.dart';

class WorkoutModel {
  String name;
  double workoutTime;
  String description;
  String image;
  String difficulty;
  List<String> goodFor;
  List<String> notGoodFor;
  List<ExerciseModel> exercises;

  WorkoutModel({
    required this.name,
    required this.description,
    required this.image,
    required this.difficulty,
    required this.workoutTime,
    required this.goodFor,
    required this.notGoodFor,
    required this.exercises,
  });
}
