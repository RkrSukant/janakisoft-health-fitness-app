import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ExerciseHomeScreen extends ConsumerStatefulWidget {
  const ExerciseHomeScreen({super.key});

  @override
  ConsumerState createState() => _ExerciseHomeScreenState();
}

class _ExerciseHomeScreenState extends ConsumerState<ExerciseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
