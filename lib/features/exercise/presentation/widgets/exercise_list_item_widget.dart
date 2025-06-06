import 'package:flutter/material.dart';
import 'package:janakisoft_health_fitness_app/features/exercise/data/model/exercise_model.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/colors.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/text_styles.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';

class ExerciseListItemWidget extends StatefulWidget {
  final ExerciseModel exercise;

  const ExerciseListItemWidget({super.key, required this.exercise});

  @override
  State<ExerciseListItemWidget> createState() => _ExerciseListItemWidgetState();
}

class _ExerciseListItemWidgetState extends State<ExerciseListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(Dimens.spacing_16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.exercise.image,
              width: Dimens.spacing_64,
            ),
            addHorizontalSpace(Dimens.spacing_8),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.exercise.name,
                    style: text1F2024s16w600,
                  ),
                  addVerticalSpace(Dimens.spacing_4),
                  Text(
                    (widget.exercise.hasTimer)
                        ? "${widget.exercise.time} Secs"
                        : "${widget.exercise.reps} reps x ${widget.exercise.sets} sets",
                    style: text8F9098s14w500,
                  ),
                ],
              ),
            ),
            addHorizontalSpace(Dimens.spacing_4),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: Dimens.spacing_12,
            )
          ],
        ),
      ),
    );
  }
}
