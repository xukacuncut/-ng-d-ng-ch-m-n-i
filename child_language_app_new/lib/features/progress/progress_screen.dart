import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/lesson_progress_provider.dart';
import '../../data/lessons_data.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressState = ref.watch(lessonProgressProvider);
    final allLessons = LessonsData.getAllLessons();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('📊 Tiến Độ Học Tập'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Overall progress card
                _buildOverallProgressCard(progressState, allLessons.length),
                
                const SizedBox(height: 20),
                
                // Statistics cards
                _buildStatisticsRow(progressState, allLessons),
                
                const SizedBox(height: 20),
                
                // Level progress
                _buildLevelProgress(progressState),
                
                const SizedBox(height: 20),
                
                // Recent achievements
                _buildRecentAchievements(progressState),
                
                const SizedBox(height: 20),
                
                // Study time chart (placeholder)
                _buildStudyTimeChart(progressState),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildOverallProgressCard(LessonProgressState progressState, int totalLessons) {
    final completedCount = progressState.completedLessons.length;
    final progressPercent = totalLessons > 0 ? (completedCount / totalLessons) : 0.0;
    
    return Container(
      padding: const EdgeInsets.all(24),
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
            '🌟 Tổng Quan Tiến Độ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 20),
          
          // Circular progress indicator
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: progressPercent,
                  strokeWidth: 12,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
              ),
              Column(
                children: [
                  Text(
                    '${(progressPercent * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const Text(
                    'hoàn thành',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$completedCount',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              Text(
                ' / $totalLessons',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Text(
            'bài học đã hoàn thành',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStatisticsRow(LessonProgressState progressState, List<dynamic> allLessons) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            '🔥',
            '${progressState.streakDays}',
            'Ngày liên tiếp',
            Colors.orange,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            '⭐',
            '${progressState.completedExercises.length}',
            'Bài tập hoàn thành',
            Colors.blue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            '⏰',
            '${progressState.totalStudyTimeMinutes}',
            'Phút học tập',
            Colors.green,
          ),
        ),
      ],
    );
  }
  
  Widget _buildStatCard(String icon, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  Widget _buildLevelProgress(LessonProgressState progressState) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📈 Tiến Độ Theo Cấp Độ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 16),
          
          ...List.generate(4, (index) {
            final level = index + 1;
            final levelLessons = LessonsData.getLessonsByLevel(level);
            final completedInLevel = levelLessons
                .where((lesson) => progressState.completedLessons.contains(lesson.id))
                .length;
            final progressInLevel = levelLessons.isNotEmpty 
                ? completedInLevel / levelLessons.length 
                : 0.0;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildLevelProgressBar(
                level,
                progressInLevel,
                completedInLevel,
                levelLessons.length,
              ),
            );
          }),
        ],
      ),
    );
  }
  
  Widget _buildLevelProgressBar(int level, double progress, int completed, int total) {
    final levelNames = {
      1: '🔤 Cơ Bản',
      2: '📝 Trung Bình', 
      3: '🗣️ Nâng Cao',
      4: '💬 Thành Thạo',
    };
    
    final levelColors = {
      1: Colors.blue,
      2: Colors.green,
      3: Colors.orange,
      4: Colors.purple,
    };
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              levelNames[level] ?? 'Level $level',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$completed/$total',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation<Color>(levelColors[level] ?? Colors.grey),
          minHeight: 8,
        ),
      ],
    );
  }
  
  Widget _buildRecentAchievements(LessonProgressState progressState) {
    // Generate some sample achievements based on progress
    final achievements = <Map<String, dynamic>>[];
    
    if (progressState.completedLessons.length >= 1) {
      achievements.add({
        'icon': '🎯',
        'title': 'Bài học đầu tiên',
        'description': 'Hoàn thành bài học đầu tiên!',
        'date': 'Hôm nay',
      });
    }
    
    if (progressState.streakDays >= 3) {
      achievements.add({
        'icon': '🔥',
        'title': 'Kiên trì',
        'description': 'Học liên tục 3 ngày!',
        'date': 'Hôm nay',
      });
    }
    
    if (progressState.completedLessons.length >= 5) {
      achievements.add({
        'icon': '⭐',
        'title': 'Học sinh giỏi',
        'description': 'Hoàn thành 5 bài học!',
        'date': 'Hôm qua',
      });
    }
    
    if (achievements.isEmpty) {
      achievements.add({
        'icon': '🌟',
        'title': 'Chào mừng!',
        'description': 'Bắt đầu hành trình học tập',
        'date': 'Hôm nay',
      });
    }
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🏆 Thành Tích Gần Đây',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 16),
          
          ...achievements.map((achievement) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      achievement['icon'],
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        achievement['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        achievement['description'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  achievement['date'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
  
  Widget _buildStudyTimeChart(LessonProgressState progressState) {
    // Simple study time visualization
    final days = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    final studyTime = [10, 15, 20, 25, 30, 15, 5]; // Sample data
    final maxTime = studyTime.reduce((a, b) => a > b ? a : b);
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📊 Thời Gian Học Trong Tuần',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(7, (index) {
              final height = (studyTime[index] / maxTime) * 100;
              
              return Column(
                children: [
                  Container(
                    width: 30,
                    height: height.clamp(10, 100),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    days[index],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${studyTime[index]}p',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            }),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                'Tổng: ${progressState.totalStudyTimeMinutes} phút tuần này',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}