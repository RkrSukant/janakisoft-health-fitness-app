import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/features/exercise/data/model/workout_model.dart';
import 'package:janakisoft_health_fitness_app/routes/app_route.gr.dart';
import 'package:janakisoft_health_fitness_app/routes/route_util.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';

class ExerciseWorkoutListItemWidget extends StatelessWidget {
  final WorkoutModel workout;

  const ExerciseWorkoutListItemWidget({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(ExerciseWorkoutDetailRoute(workoutModel: workout));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.spacing_16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.spacing_16),
          child: Stack(
            children: [
              // Background image
              Image.asset(
                workout.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),

              // Gradient overlay for text readability
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Foreground content
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.spacing_16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        workout.name,
                        style: textFFFFFFs24w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      addVerticalSpace(4),

                      // Description
                      Text(
                        workout.description,
                        style: textFFFFFFs12w400,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      addVerticalSpace(8),

                      // Metadata
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              size: 14, color: Colors.white.withOpacity(0.9)),
                          addHorizontalSpace(4),
                          Text("${workout.workoutTime.toInt()} min",
                              style: textFFFFFFs12w500),
                          addHorizontalSpace(12),
                          Icon(Icons.trending_up,
                              size: 14, color: Colors.white.withOpacity(0.9)),
                          addHorizontalSpace(4),
                          Text(workout.difficulty, style: textFFFFFFs12w500),
                          addHorizontalSpace(12),
                          Icon(Icons.fitness_center,
                              size: 14, color: Colors.white.withOpacity(0.9)),
                          addHorizontalSpace(4),
                          Text("${workout.exercises.length}",
                              style: textFFFFFFs12w500),
                        ],
                      ),

                      addVerticalSpace(12),

                      // Tags
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: workout.goodFor.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.3)),
                            ),
                            child: Text(tag, style: textFFFFFFs10w500),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
