class Lesson {
  final String id;
  final String title;
  final String description;
  final int level;
  final String audioPath;
  final String imagePath;
  final List<Exercise> exercises;
  final Duration? estimatedDuration;
  final List<String> tags;
  
  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.audioPath,
    required this.imagePath,
    required this.exercises,
    this.estimatedDuration,
    this.tags = const [],
  });
  
  // Progress calculation
  double getCompletionRate(List<String> completedExercises) {
    if (exercises.isEmpty) return 0.0;
    
    int completed = exercises
        .where((ex) => completedExercises.contains(ex.id))
        .length;
    
    return completed / exercises.length;
  }
  
  bool isCompleted(List<String> completedExercises) {
    return getCompletionRate(completedExercises) >= 1.0;
  }
}

class Exercise {
  final String id;
  final String instruction;
  final String expectedAnswer;
  final String? audioPath;
  final List<String> choices;
  final ExerciseType type;
  
  const Exercise({
    required this.id,
    required this.instruction,
    required this.expectedAnswer,
    this.audioPath,
    this.choices = const [],
    this.type = ExerciseType.pronunciation,
  });
}

enum ExerciseType {
  pronunciation,
  multipleChoice,
  listening,
  speaking,
  matching,
}