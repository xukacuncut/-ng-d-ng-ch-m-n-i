import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeechTrainingScreen extends ConsumerStatefulWidget {
  const SpeechTrainingScreen({super.key});

  @override
  ConsumerState<SpeechTrainingScreen> createState() => _SpeechTrainingScreenState();
}

class _SpeechTrainingScreenState extends ConsumerState<SpeechTrainingScreen> {
  bool isRecording = false;
  bool isPlaying = false;
  String selectedWord = '';
  
  final List<Map<String, String>> practiceWords = [
    {'word': 'BA', 'meaning': 'Bố'},
    {'word': 'MÁ', 'meaning': 'Mẹ'},
    {'word': 'CÔ', 'meaning': 'Cô giáo'},
    {'word': 'CHÚ', 'meaning': 'Chú'},
    {'word': 'CON', 'meaning': 'Con'},
    {'word': 'NƯỚC', 'meaning': 'Nước uống'},
    {'word': 'CƠM', 'meaning': 'Cơm ăn'},
    {'word': 'CHÓ', 'meaning': 'Con chó'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎤 Luyện Tập Phát Âm'),
        backgroundColor: Colors.blue,
        elevation: 0,
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
                        '🎙️ Luyện Tập Phát Âm',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Chọn từ và luyện tập phát âm chuẩn',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Word selection
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chọn từ để luyện tập:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 2.5,
                            ),
                            itemCount: practiceWords.length,
                            itemBuilder: (context, index) {
                              final wordData = practiceWords[index];
                              final isSelected = selectedWord == wordData['word'];
                              
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedWord = wordData['word']!;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected ? Colors.blue[100] : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected ? Colors.blue : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        wordData['word']!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected ? Colors.blue : Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        wordData['meaning']!,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isSelected ? Colors.blue[700] : Colors.grey[600],
                                        ),
                                      ),
                                    ],
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
                
                const SizedBox(height: 20),
                
                // Practice area
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: selectedWord.isEmpty
                        ? const Center(
                            child: Text(
                              'Chọn một từ để bắt đầu luyện tập',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : _buildPracticeArea(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildPracticeArea() {
    return Column(
      children: [
        // Selected word display
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: Text(
            selectedWord,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Audio controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Play sample audio
            ElevatedButton.icon(
              onPressed: _playSampleAudio,
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(isPlaying ? 'Dừng' : 'Nghe mẫu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            
            // Record user audio
            ElevatedButton.icon(
              onPressed: isRecording ? _stopRecording : _startRecording,
              icon: Icon(isRecording ? Icons.stop : Icons.mic),
              label: Text(isRecording ? 'Dừng' : 'Ghi âm'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isRecording ? Colors.red : Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 20),
        
        // Recording indicator
        if (isRecording)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fiber_manual_record, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  'Đang ghi âm... Nói rõ ràng',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        
        const Spacer(),
        
        // Instructions
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            children: [
              Icon(Icons.lightbulb, color: Colors.orange, size: 32),
              SizedBox(height: 8),
              Text(
                'Hướng dẫn:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '1. Nhấn "Nghe mẫu" để nghe cách phát âm\n'
                '2. Nhấn "Ghi âm" và nói theo mẫu\n'
                '3. Lặp lại nhiều lần để luyện tập',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  void _playSampleAudio() {
    setState(() {
      isPlaying = !isPlaying;
    });
    
    // TODO: Implement audio playback
    // AudioPlayer implementation would go here
    
    // Simulate audio playback
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
  
  void _startRecording() {
    setState(() {
      isRecording = true;
    });
    
    // TODO: Implement audio recording
    // Audio recording implementation would go here
    
    // Auto-stop recording after 5 seconds
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
    
    // Simulate analysis
    Future.delayed(const Duration(milliseconds: 500), () {
      _showFeedback();
    });
  }
  
  void _showFeedback() {
    // Simulate random feedback for demo
    final success = DateTime.now().millisecond % 2 == 0;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(success ? '🎉 Tuyệt vời!' : '💪 Cần luyện thêm!'),
        content: Text(
          success 
              ? 'Phát âm của bạn rất chuẩn! Hãy thử từ khác.'
              : 'Hãy nghe mẫu và thử lại. Nhớ phát âm chậm và rõ ràng.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
          if (success)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Select next word automatically
                final currentIndex = practiceWords.indexWhere((w) => w['word'] == selectedWord);
                if (currentIndex < practiceWords.length - 1) {
                  setState(() {
                    selectedWord = practiceWords[currentIndex + 1]['word']!;
                  });
                }
              },
              child: const Text('Từ tiếp theo'),
            ),
        ],
      ),
    );
  }
}