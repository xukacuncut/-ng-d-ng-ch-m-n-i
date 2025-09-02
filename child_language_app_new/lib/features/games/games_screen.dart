import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamesScreen extends ConsumerStatefulWidget {
  const GamesScreen({super.key});

  @override
  ConsumerState<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends ConsumerState<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎮 Trò Chơi'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.lightGreen],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        '🎯 Trò Chơi Học Tập',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Học qua vui chơi, nhớ lâu hơn!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Games grid
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildGameCard(
                        title: 'Trò Chơi Ghép Thẻ',
                        subtitle: 'Ghép âm thanh với hình ảnh',
                        icon: Icons.style,
                        color: Colors.blue,
                        onTap: () => _openMemoryGame(),
                      ),
                      _buildGameCard(
                        title: 'Nhận Biết Âm Thanh',
                        subtitle: 'Nghe và chọn đúng',
                        icon: Icons.hearing,
                        color: Colors.orange,
                        onTap: () => _openSoundRecognitionGame(),
                      ),
                      _buildGameCard(
                        title: 'Thử Thách Phát Âm',
                        subtitle: 'Nói càng chuẩn càng hay',
                        icon: Icons.mic,
                        color: Colors.red,
                        onTap: () => _openPronunciationChallenge(),
                      ),
                      _buildGameCard(
                        title: 'Xếp Chữ Cái',
                        subtitle: 'Kéo thả tạo từ',
                        icon: Icons.text_fields,
                        color: Colors.purple,
                        onTap: () => _openWordPuzzle(),
                      ),
                      _buildGameCard(
                        title: 'Kể Chuyện',
                        subtitle: 'Sắp xếp câu chuyện',
                        icon: Icons.auto_stories,
                        color: Colors.teal,
                        onTap: () => _openStoryBuilding(),
                      ),
                      _buildGameCard(
                        title: 'Bài Hát Vui',
                        subtitle: 'Học qua bài hát',
                        icon: Icons.music_note,
                        color: Colors.pink,
                        onTap: () => _openSingingGame(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildGameCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _openMemoryGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MemoryCardGame(),
      ),
    );
  }
  
  void _openSoundRecognitionGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SoundRecognitionGame(),
      ),
    );
  }
  
  void _openPronunciationChallenge() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🎤 Thử Thách Phát Âm'),
        content: const Text('Trò chơi này sẽ sớm có mặt trong phiên bản tiếp theo!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  void _openWordPuzzle() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🧩 Xếp Chữ Cái'),
        content: const Text('Trò chơi này sẽ sớm có mặt trong phiên bản tiếp theo!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  void _openStoryBuilding() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('📚 Kể Chuyện'),
        content: const Text('Trò chơi này sẽ sớm có mặt trong phiên bản tiếp theo!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  void _openSingingGame() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🎵 Bài Hát Vui'),
        content: const Text('Trò chơi này sẽ sớm có mặt trong phiên bản tiếp theo!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Memory Card Game Implementation
class MemoryCardGame extends StatefulWidget {
  const MemoryCardGame({super.key});

  @override
  State<MemoryCardGame> createState() => _MemoryCardGameState();
}

class _MemoryCardGameState extends State<MemoryCardGame> {
  List<String> cards = [];
  List<bool> cardFlipped = [];
  List<bool> cardMatched = [];
  int? firstCard;
  int? secondCard;
  int score = 0;
  int moves = 0;
  bool isChecking = false;
  
  final List<String> cardPairs = [
    '🐶', '🐱', '🐰', '🐸', '🦆', '🐠',
    '🐶', '🐱', '🐰', '🐸', '🦆', '🐠',
  ];

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    cards = List.from(cardPairs);
    cards.shuffle();
    cardFlipped = List.filled(cards.length, false);
    cardMatched = List.filled(cards.length, false);
    firstCard = null;
    secondCard = null;
    score = 0;
    moves = 0;
    isChecking = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎴 Trò Chơi Ghép Thẻ'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _initializeGame();
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlue],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Score and moves
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Điểm',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$score',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Lượt chơi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$moves',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Game grid
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: isChecking ? null : () => _onCardTapped(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: cardMatched[index] 
                                ? Colors.green[100] 
                                : cardFlipped[index] 
                                    ? Colors.white 
                                    : Colors.blue[300],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: cardMatched[index] ? Colors.green : Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              cardFlipped[index] || cardMatched[index] 
                                  ? cards[index] 
                                  : '❓',
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Instructions
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Nhấn vào thẻ để lật và tìm cặp giống nhau!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void _onCardTapped(int index) {
    if (cardFlipped[index] || cardMatched[index]) return;
    
    setState(() {
      cardFlipped[index] = true;
      
      if (firstCard == null) {
        firstCard = index;
      } else if (secondCard == null) {
        secondCard = index;
        moves++;
        isChecking = true;
        
        // Check for match
        Future.delayed(const Duration(milliseconds: 1000), () {
          _checkMatch();
        });
      }
    });
  }
  
  void _checkMatch() {
    if (firstCard != null && secondCard != null) {
      if (cards[firstCard!] == cards[secondCard!]) {
        // Match found
        setState(() {
          cardMatched[firstCard!] = true;
          cardMatched[secondCard!] = true;
          score += 10;
        });
        
        // Check if game is complete
        if (cardMatched.every((matched) => matched)) {
          _showGameComplete();
        }
      } else {
        // No match
        setState(() {
          cardFlipped[firstCard!] = false;
          cardFlipped[secondCard!] = false;
        });
      }
      
      setState(() {
        firstCard = null;
        secondCard = null;
        isChecking = false;
      });
    }
  }
  
  void _showGameComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('🎉 Chúc mừng!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bạn đã hoàn thành trò chơi!'),
            const SizedBox(height: 16),
            Text(
              'Điểm số: $score\nSố lượt: $moves',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _initializeGame();
              });
            },
            child: const Text('Chơi lại'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Về menu'),
          ),
        ],
      ),
    );
  }
}

// Sound Recognition Game
class SoundRecognitionGame extends StatefulWidget {
  const SoundRecognitionGame({super.key});

  @override
  State<SoundRecognitionGame> createState() => _SoundRecognitionGameState();
}

class _SoundRecognitionGameState extends State<SoundRecognitionGame> {
  int currentQuestion = 0;
  int score = 0;
  bool isPlaying = false;
  
  final List<Map<String, dynamic>> questions = [
    {
      'sound': '🐶',
      'question': 'Con vật nào kêu "gâu gâu"?',
      'options': ['🐶', '🐱', '🐰', '🐸'],
      'correct': 0,
    },
    {
      'sound': '🐱',
      'question': 'Con vật nào kêu "meo meo"?',
      'options': ['🐶', '🐱', '🐰', '🐸'],
      'correct': 1,
    },
    {
      'sound': '🐸',
      'question': 'Con vật nào kêu "ếch ếch"?',
      'options': ['🐶', '🐱', '🐰', '🐸'],
      'correct': 3,
    },
    {
      'sound': '🦆',
      'question': 'Con vật nào kêu "cạp cạp"?',
      'options': ['🐷', '🦆', '🐄', '🐓'],
      'correct': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('👂 Nhận Biết Âm Thanh'),
        backgroundColor: Colors.orange,
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Progress and score
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Câu ${currentQuestion + 1}/${questions.length}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Điểm: $score',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Sound display and play button
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        question['sound'],
                        style: const TextStyle(fontSize: 80),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: _playSound,
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        label: Text(isPlaying ? 'Dừng' : 'Nghe âm thanh'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Question
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    question['question'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Answer options
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: question['options'].length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _selectAnswer(index),
                        child: Container(
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
                          child: Center(
                            child: Text(
                              question['options'][index],
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void _playSound() {
    setState(() {
      isPlaying = !isPlaying;
    });
    
    // TODO: Implement actual sound playback
    // AudioPlayer implementation would go here
    
    // Simulate sound playback
    if (isPlaying) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            isPlaying = false;
          });
        }
      });
    }
  }
  
  void _selectAnswer(int selectedIndex) {
    final question = questions[currentQuestion];
    final isCorrect = selectedIndex == question['correct'];
    
    if (isCorrect) {
      score += 10;
    }
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? '🎉 Đúng rồi!' : '😅 Sai rồi!'),
        content: Text(
          isCorrect 
              ? 'Chúc mừng! Bạn đã chọn đúng.'
              : 'Đáp án đúng là: ${question['options'][question['correct']]}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _nextQuestion();
            },
            child: const Text('Tiếp tục'),
          ),
        ],
      ),
    );
  }
  
  void _nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      _showGameComplete();
    }
  }
  
  void _showGameComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('🎊 Hoàn thành!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bạn đã hoàn thành tất cả câu hỏi!'),
            const SizedBox(height: 16),
            Text(
              'Điểm cuối: $score/${questions.length * 10}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestion = 0;
                score = 0;
              });
            },
            child: const Text('Chơi lại'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Về menu'),
          ),
        ],
      ),
    );
  }
}