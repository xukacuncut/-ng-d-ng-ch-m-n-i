import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/lessons_data.dart';
import '../../models/lesson.dart';
import '../../providers/lesson_progress_provider.dart';

class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = LessonsData.getAllLessons();
    final progressState = ref.watch(lessonProgressProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 Bài Học'),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.deepOrange],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Header với progress overview
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '🌟 Hành Trình Học Tập',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildProgressOverview(progressState, lessons.length),
                    ],
                  ),
                ),
              ),
              
              // Lessons grouped by level
              ...List.generate(4, (index) {
                final level = index + 1;
                final levelLessons = LessonsData.getLessonsByLevel(level);
                
                if (levelLessons.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
                
                return SliverToBoxAdapter(
                  child: _buildLevelSection(context, ref, level, levelLessons, progressState),
                );
              }),
              
              // Spacing at bottom
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildProgressOverview(LessonProgressState progressState, int totalLessons) {
    final completedCount = progressState.completedLessons.length;
    final progressPercent = totalLessons > 0 ? (completedCount / totalLessons) : 0.0;
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatCard('📖', '$completedCount/$totalLessons', 'Hoàn thành'),
            _buildStatCard('⭐', '${(progressPercent * 100).toInt()}%', 'Tiến độ'),
            _buildStatCard('🔥', '${progressState.streakDays}', 'Ngày liên tiếp'),
          ],
        ),
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: progressPercent,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
          minHeight: 8,
        ),
      ],
    );
  }
  
  Widget _buildStatCard(String icon, String value, String label) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  
  Widget _buildLevelSection(
    BuildContext context,
    WidgetRef ref,
    int level,
    List<Lesson> lessons,
    LessonProgressState progressState,
  ) {
    final levelNames = LessonsData.getLevelNames();
    final levelDescriptions = LessonsData.getLevelDescriptions();
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getLevelColor(level),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  levelNames[level] ?? 'Level $level',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  levelDescriptions[level] ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          
          // Lessons grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              final isCompleted = progressState.completedLessons.contains(lesson.id);
              final isUnlocked = _isLessonUnlocked(lesson, progressState);
              
              return _buildLessonCard(context, ref, lesson, isCompleted, isUnlocked);
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildLessonCard(
    BuildContext context,
    WidgetRef ref,
    Lesson lesson,
    bool isCompleted,
    bool isUnlocked,
  ) {
    return GestureDetector(
      onTap: isUnlocked ? () => _openLesson(context, ref, lesson) : null,
      child: Container(
        decoration: BoxDecoration(
          color: isUnlocked ? Colors.white : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
          boxShadow: isUnlocked ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ] : null,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lesson icon/image
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: _getLevelColor(lesson.level).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getLessonIcon(lesson.level),
                      size: 40,
                      color: isUnlocked ? _getLevelColor(lesson.level) : Colors.grey,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Lesson title
                  Text(
                    lesson.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isUnlocked ? Colors.black87 : Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // Lesson description
                  Text(
                    lesson.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: isUnlocked ? Colors.grey[600] : Colors.grey[400],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const Spacer(),
                  
                  // Duration and exercises info
                  if (isUnlocked)
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 12, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${lesson.estimatedDuration?.inMinutes ?? 10}p',
                          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.quiz, size: 12, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '${lesson.exercises.length}',
                          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  
                  const SizedBox(height: 8),
                  
                  // Progress or lock indicator
                  if (!isUnlocked)
                    const Row(
                      children: [
                        Icon(Icons.lock, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('Khóa', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    )
                  else if (isCompleted)
                    const Row(
                      children: [
                        Icon(Icons.check_circle, size: 16, color: Colors.green),
                        SizedBox(width: 4),
                        Text('Hoàn thành', style: TextStyle(fontSize: 12, color: Colors.green)),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Icon(Icons.play_circle, size: 16, color: _getLevelColor(lesson.level)),
                        const SizedBox(width: 4),
                        Text(
                          'Bắt đầu',
                          style: TextStyle(
                            fontSize: 12,
                            color: _getLevelColor(lesson.level),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            
            // Completion badge
            if (isCompleted)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  Color _getLevelColor(int level) {
    switch (level) {
      case 1: return Colors.blue;
      case 2: return Colors.green;
      case 3: return Colors.orange;
      case 4: return Colors.purple;
      default: return Colors.grey;
    }
  }
  
  IconData _getLessonIcon(int level) {
    switch (level) {
      case 1: return Icons.abc;
      case 2: return Icons.spellcheck;
      case 3: return Icons.record_voice_over;
      case 4: return Icons.chat;
      default: return Icons.book;
    }
  }
  
  bool _isLessonUnlocked(Lesson lesson, LessonProgressState progressState) {
    // Level 1 lessons are always unlocked
    if (lesson.level == 1) return true;
    
    // Check if previous level is completed
    final previousLevelLessons = LessonsData.getLessonsByLevel(lesson.level - 1);
    if (previousLevelLessons.isEmpty) return true;
    
    final completedPreviousLevel = previousLevelLessons
        .every((l) => progressState.completedLessons.contains(l.id));
    
    return completedPreviousLevel;
  }
  
  void _openLesson(BuildContext context, WidgetRef ref, Lesson lesson) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonDetailScreen(lesson: lesson),
      ),
    );
  }
}

// Lesson Detail Screen for interactive exercises
class LessonDetailScreen extends ConsumerStatefulWidget {
  final Lesson lesson;
  
  const LessonDetailScreen({
    super.key,
    required this.lesson,
  });

  @override
  ConsumerState<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  int currentExerciseIndex = 0;
  bool isPlaying = false;
  bool isRecording = false;
  
  @override
  Widget build(BuildContext context) {
    final exercise = widget.lesson.exercises[currentExerciseIndex];
    final progress = (currentExerciseIndex + 1) / widget.lesson.exercises.length;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => _showHelp(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.deepOrange],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progress bar
              Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bài tập ${currentExerciseIndex + 1}/${widget.lesson.exercises.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ],
                ),
              ),
              
              // Exercise content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _buildExerciseContent(exercise),
                ),
              ),
              
              // Navigation buttons
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (currentExerciseIndex > 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _previousExercise,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black87,
                          ),
                          child: const Text('Quay lại'),
                        ),
                      ),
                    
                    if (currentExerciseIndex > 0) const SizedBox(width: 16),
                    
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: _nextExercise,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          currentExerciseIndex < widget.lesson.exercises.length - 1
                              ? 'Tiếp theo'
                              : 'Hoàn thành',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildExerciseContent(Exercise exercise) {
    return Column(
      children: [
        // Exercise instruction
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            exercise.instruction,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Audio player if available
        if (exercise.audioPath != null)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Text(
                  '🎵 Nghe âm thanh mẫu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _playAudio,
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  label: Text(isPlaying ? 'Tạm dừng' : 'Phát'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        
        const SizedBox(height: 24),
        
        // Exercise interaction area
        Expanded(
          child: _buildExerciseInteraction(exercise),
        ),
      ],
    );
  }
  
  Widget _buildExerciseInteraction(Exercise exercise) {
    switch (exercise.type) {
      case ExerciseType.multipleChoice:
        return _buildMultipleChoice(exercise);
      case ExerciseType.pronunciation:
        return _buildPronunciationPractice(exercise);
      default:
        return _buildPronunciationPractice(exercise);
    }
  }
  
  Widget _buildMultipleChoice(Exercise exercise) {
    return Column(
      children: [
        const Text(
          'Chọn đáp án đúng:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: exercise.choices.length,
            itemBuilder: (context, index) {
              final choice = exercise.choices[index];
              
              return ElevatedButton(
                onPressed: () => _selectChoice(choice, exercise.expectedAnswer),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  foregroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  choice,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  
  Widget _buildPronunciationPractice(Exercise exercise) {
    return Column(
      children: [
        Icon(
          isRecording ? Icons.mic : Icons.mic_none,
          size: 80,
          color: isRecording ? Colors.red : Colors.grey,
        ),
        const SizedBox(height: 16),
        
        const Text(
          'Nhấn nút mic và nói theo mẫu:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: Text(
            exercise.expectedAnswer,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        ElevatedButton.icon(
          onPressed: isRecording ? _stopRecording : _startRecording,
          icon: Icon(isRecording ? Icons.stop : Icons.mic),
          label: Text(isRecording ? 'Dừng ghi âm' : 'Bắt đầu ghi âm'),
          style: ElevatedButton.styleFrom(
            backgroundColor: isRecording ? Colors.red : Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        
        if (isRecording)
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: const Text(
              '🎙️ Đang ghi âm... Nói rõ ràng vào mic',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
  
  void _playAudio() {
    setState(() {
      isPlaying = !isPlaying;
    });
    
    // TODO: Implement audio playback
    // AudioPlayer implementation would go here
    
    // Simulate audio duration
    if (isPlaying) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            isPlaying = false;
          });
        }
      });
    }
  }
  
  void _startRecording() {
    setState(() {
      isRecording = true;
    });
    
    // TODO: Implement audio recording
    // Audio recording implementation would go here
    
    // Simulate recording duration (auto-stop after 5 seconds)
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && isRecording) {
        _stopRecording();
      }
    });
  }
  
  void _stopRecording() {
    setState(() {
      isRecording = false;
    });
    
    // Simulate pronunciation analysis
    Future.delayed(const Duration(milliseconds: 500), () {
      _showRecordingResult(true); // Simulate success for demo
    });
  }
  
  void _showRecordingResult(bool success) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(success ? '🎉 Tuyệt vời!' : '😅 Thử lại nhé!'),
        content: Text(
          success 
              ? 'Bạn đã phát âm rất chuẩn!'
              : 'Hãy thử phát âm chậm và rõ ràng hơn.',
        ),
        actions: [
          if (!success)
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Thử lại'),
            ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (success) {
                ref.read(lessonProgressProvider.notifier)
                    .completeExercise(widget.lesson.exercises[currentExerciseIndex].id, 1.0);
                _nextExercise();
              }
            },
            child: Text(success ? 'Tiếp tục' : 'OK'),
          ),
        ],
      ),
    );
  }
  
  void _selectChoice(String choice, String correct) {
    final isCorrect = choice == correct;
    
    if (isCorrect) {
      ref.read(lessonProgressProvider.notifier)
          .completeExercise(widget.lesson.exercises[currentExerciseIndex].id, 1.0);
    }
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? '🎉 Chính xác!' : '😅 Sai rồi!'),
        content: Text(
          isCorrect 
              ? 'Bạn đã chọn đúng đáp án!'
              : 'Đáp án đúng là: $correct',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (isCorrect) _nextExercise();
            },
            child: Text(isCorrect ? 'Tiếp tục' : 'Thử lại'),
          ),
        ],
      ),
    );
  }
  
  void _previousExercise() {
    if (currentExerciseIndex > 0) {
      setState(() {
        currentExerciseIndex--;
      });
    }
  }
  
  void _nextExercise() {
    if (currentExerciseIndex < widget.lesson.exercises.length - 1) {
      setState(() {
        currentExerciseIndex++;
      });
    } else {
      _completeLesson();
    }
  }
  
  void _completeLesson() {
    // Mark lesson as completed
    ref.read(lessonProgressProvider.notifier).completeLesson(widget.lesson.id);
    
    // Show completion dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🎊 Hoàn thành bài học!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Chúc mừng! Bạn đã hoàn thành bài học này.'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.stars, color: Colors.orange),
                  SizedBox(width: 8),
                  Text(
                    '+10 điểm kinh nghiệm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Back to lessons list
            },
            child: const Text('Về danh sách bài học'),
          ),
        ],
      ),
    );
  }
  
  void _showHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('💡 Hướng dẫn'),
        content: const Text(
          '• Nghe audio mẫu bằng cách nhấn nút phát\n'
          '• Thực hiện bài tập theo hướng dẫn\n'
          '• Với bài phát âm: nhấn mic và nói theo mẫu\n'
          '• Với bài trắc nghiệm: chọn đáp án đúng\n'
          '• Hoàn thành tất cả bài tập để qua bài mới',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đã hiểu'),
          ),
        ],
      ),
    );
  }
}