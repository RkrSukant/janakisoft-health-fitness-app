class ExerciseModel {
  String name;
  double time;
  int reps;
  int sets;
  String description;
  String image;//todo need gif or video as well
  bool hasTimer;
  String difficulty;
  List<String> goodFor; //todo replace with actual models
  List<String> notGoodFor; //todo replace with actual models

  ExerciseModel({
    required this.name,
    required this.time,
    required this.reps,
    required this.sets,
    required this.description,
    required this.image,
    required this.hasTimer,
    required this.difficulty,
    required this.goodFor,
    required this.notGoodFor,
  });

  factory ExerciseModel.mock(String nameSuffix) {
    return ExerciseModel(
      name: "Exercise $nameSuffix",
      time: 30 + nameSuffix.length * 5,
      reps: 10 + nameSuffix.length % 5,
      sets: 3,
      description: "A great workout exercise for strength and endurance.",
      image: "https://source.unsplash.com/200x200/?exercise,$nameSuffix",
      hasTimer: nameSuffix.length % 2 == 0,
      difficulty: ["Easy", "Medium", "Hard"][nameSuffix.length % 3],
      goodFor: ["Strength", "Endurance"],
      notGoodFor: ["Joint Pain"],
    );
  }
}
