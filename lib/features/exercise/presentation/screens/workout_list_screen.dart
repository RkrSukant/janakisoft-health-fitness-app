import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janakisoft_health_fitness_app/features/exercise/data/model/exercise_model.dart';
import 'package:janakisoft_health_fitness_app/features/exercise/data/model/workout_model.dart';
import 'package:janakisoft_health_fitness_app/features/exercise/presentation/widgets/exercise_workout_list_item_widget.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/dimens.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/image_constants.dart';
import 'package:janakisoft_health_fitness_app/shared/helpers/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class WorkoutListScreen extends ConsumerStatefulWidget {
  const WorkoutListScreen({super.key});

  @override
  ConsumerState createState() => _ExerciseHomeScreenState();
}

class _ExerciseHomeScreenState extends ConsumerState<WorkoutListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _recommendedController = PageController(viewportFraction: 0.85);
  List<WorkoutModel> allWorkouts = [];
  List<WorkoutModel> filteredWorkouts = [];

  List<String> selectedGoodFor = [];
  String? selectedDifficulty;

  @override
  void initState() {
    super.initState();
    allWorkouts = _generateMockWorkouts();
    filteredWorkouts = allWorkouts;
  }

  void _filterWorkouts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredWorkouts = allWorkouts.where((workout) {
        final matchesSearch = workout.name.toLowerCase().contains(query);
        final matchesGoodFor = selectedGoodFor.isEmpty ||
            selectedGoodFor.any((g) => workout.goodFor.contains(g));
        final matchesDifficulty = selectedDifficulty == null ||
            workout.difficulty == selectedDifficulty;
        return matchesSearch && matchesGoodFor && matchesDifficulty;
      }).toList();
    });
  }

  void _openFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final goodForOptions = [
          "Weight Loss",
          "Strength",
          "Flexibility",
          "Cardio",
          "Endurance"
        ];
        final difficultyLevels = ["Easy", "Medium", "Hard"];

        List<String> tempGoodFor = List.from(selectedGoodFor);
        String? tempDifficulty = selectedDifficulty;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter Workouts",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text("Good For"),
                  Wrap(
                    spacing: 8,
                    children: goodForOptions.map((option) {
                      return FilterChip(
                        label: Text(option),
                        selected: tempGoodFor.contains(option),
                        onSelected: (selected) {
                          setModalState(() {
                            if (selected) {
                              tempGoodFor.add(option);
                            } else {
                              tempGoodFor.remove(option);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text("Difficulty"),
                  Wrap(
                    spacing: 8,
                    children: difficultyLevels.map((level) {
                      return ChoiceChip(
                        label: Text(level),
                        selected: tempDifficulty == level,
                        onSelected: (selected) {
                          setModalState(() {
                            tempDifficulty = selected ? level : null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedGoodFor = tempGoodFor;
                          selectedDifficulty = tempDifficulty;
                          _filterWorkouts();
                        });
                        Navigator.pop(context);
                      },
                      child: const Text("Apply Filters"),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final recommended = allWorkouts.take(4).toList();
    final isSearching = _searchController.text.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (_) => _filterWorkouts(),
                      decoration: InputDecoration(
                        hintText: 'Search workouts...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: _openFilterBottomSheet,
                  ),
                ],
              ),
              addVerticalSpace(Dimens.spacing_8),

              if (selectedGoodFor.isNotEmpty || selectedDifficulty != null)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...selectedGoodFor.map((option) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(option),
                          selected: true,
                          onSelected: (selected) {
                            setState(() {
                              selectedGoodFor.remove(option);
                              _filterWorkouts();
                            });
                          },
                        ),
                      )),
                      if (selectedDifficulty != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(selectedDifficulty!),
                            selected: true,
                            onSelected: (_) {
                              setState(() {
                                selectedDifficulty = null;
                                _filterWorkouts();
                              });
                            },
                          ),
                        )
                    ],
                  ),
                ),

              const SizedBox(height: 16),

              if (!isSearching) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Recommended for you",
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    controller: _recommendedController,
                    itemCount: recommended.length,
                    itemBuilder: (context, index) {
                      final workout = recommended[index];
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 12),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(workout.image),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(workout.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  "${workout.workoutTime.toInt()} mins - ${workout.difficulty}",
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 13),
                                ),
                                const Spacer(),
                                Text(workout.goodFor.join(", "),
                                    style: const TextStyle(
                                        color: Colors.white60, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: SmoothPageIndicator(
                    controller: _recommendedController,
                    count: recommended.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 6,
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  isSearching
                      ? "${filteredWorkouts.length} workouts found"
                      : "All Workouts",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredWorkouts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 0),
                itemBuilder: (context, index) {
                  return ExerciseWorkoutListItemWidget(
                      workout: filteredWorkouts[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<WorkoutModel> _generateMockWorkouts() {
    List<String> difficulties = ["Easy", "Medium", "Hard"];
    List<String> categories = [
      "Weight Loss",
      "Strength",
      "Cardio",
      "Flexibility",
      "Endurance"
    ];

    return List.generate(10, (i) {
      return WorkoutModel(
        name: "Workout ${i + 1}",
        description: "This is a description for Workout ${i + 1}.",
        image: ImageConstants.icWorkoutPlaceholder,
        difficulty: difficulties[i % difficulties.length],
        workoutTime: 15 + (i * 2),
        goodFor: [categories[i % categories.length]],
        notGoodFor: [],
        exercises:
        List.generate(5, (j) => ExerciseModel.mock("Exercise ${j + 1}")),
      );
    });
  }
}
