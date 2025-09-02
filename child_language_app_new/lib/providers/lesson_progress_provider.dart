import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonProgressState {
  final List<String> completedLessons;
  final List<String> completedExercises;
  final Map<String, double> lessonScores;
  final int streakDays;
  final DateTime lastActiveDate;
  final int totalStudyTimeMinutes;
  
  const LessonProgressState({
    this.completedLessons = const [],
    this.completedExercises = const [],
    this.lessonScores = const {},
    this.streakDays = 0,
    required this.lastActiveDate,
    this.totalStudyTimeMinutes = 0,
  });
  
  LessonProgressState copyWith({
    List<String>? completedLessons,
    List<String>? completedExercises,
    Map<String, double>? lessonScores,
    int? streakDays,
    DateTime? lastActiveDate,
    int? totalStudyTimeMinutes,
  }) {
    return LessonProgressState(
      completedLessons: completedLessons ?? this.completedLessons,
      completedExercises: completedExercises ?? this.completedExercises,
      lessonScores: lessonScores ?? this.lessonScores,
      streakDays: streakDays ?? this.streakDays,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      totalStudyTimeMinutes: totalStudyTimeMinutes ?? this.totalStudyTimeMinutes,
    );
  }
}

class LessonProgressNotifier extends StateNotifier<LessonProgressState> {
  LessonProgressNotifier() : super(LessonProgressState(lastActiveDate: DateTime.now()));
  
  void completeLesson(String lessonId) {
    if (!state.completedLessons.contains(lessonId)) {
      state = state.copyWith(
        completedLessons: [...state.completedLessons, lessonId],
        lastActiveDate: DateTime.now(),
      );
      _updateStreak();
    }
  }
  
  void completeExercise(String exerciseId, double score) {
    if (!state.completedExercises.contains(exerciseId)) {
      state = state.copyWith(
        completedExercises: [...state.completedExercises, exerciseId],
        lessonScores: {...state.lessonScores, exerciseId: score},
        lastActiveDate: DateTime.now(),
      );
    }
  }
  
  void addStudyTime(int minutes) {
    state = state.copyWith(
      totalStudyTimeMinutes: state.totalStudyTimeMinutes + minutes,
      lastActiveDate: DateTime.now(),
    );
    _updateStreak();
  }
  
  void _updateStreak() {
    final now = DateTime.now();
    final lastActive = state.lastActiveDate;
    final daysDiff = now.difference(lastActive).inDays;
    
    int newStreak;
    if (daysDiff == 0) {
      // Same day, keep streak
      newStreak = state.streakDays;
    } else if (daysDiff == 1) {
      // Next day, increment streak
      newStreak = state.streakDays + 1;
    } else {
      // Gap in days, reset streak
      newStreak = 1;
    }
    
    state = state.copyWith(streakDays: newStreak);
  }
  
  double getLessonProgress(String lessonId, List<String> exerciseIds) {
    final completedCount = exerciseIds
        .where((id) => state.completedExercises.contains(id))
        .length;
    
    return exerciseIds.isEmpty ? 0.0 : completedCount / exerciseIds.length;
  }
  
  double getOverallProgress(int totalLessons) {
    return totalLessons > 0 ? state.completedLessons.length / totalLessons : 0.0;
  }
}

final lessonProgressProvider = StateNotifierProvider<LessonProgressNotifier, LessonProgressState>((ref) {
  return LessonProgressNotifier();
});