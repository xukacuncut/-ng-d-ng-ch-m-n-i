import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/lessons/lessons_screen.dart';
import 'features/games/games_screen.dart';
import 'features/speech/speech_training_screen.dart';
import 'features/progress/progress_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ChildLanguageApp(),
    ),
  );
}

class ChildLanguageApp extends StatelessWidget {
  const ChildLanguageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng Dụng Trẻ Chậm Nói',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const LessonsScreen(),
    const SpeechTrainingScreen(),
    const GamesScreen(),
    const ProgressScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '📚 Bài Học',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: '🎤 Luyện Tập',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: '🎮 Trò Chơi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: '📊 Tiến Độ',
          ),
        ],
      ),
    );
  }
}