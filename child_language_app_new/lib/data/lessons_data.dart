import '../models/lesson.dart';

class LessonsData {
  static List<Lesson> getAllLessons() {
    return [
      // Bài 1-5: Âm thanh cơ bản (Level 1)
      Lesson(
        id: 'lesson_1',
        title: 'Âm "A" - Tiếng Việt Cơ Bản',
        description: 'Học phát âm chữ "A" chuẩn tiếng Việt',
        level: 1,
        audioPath: 'assets/audio/lesson_1.mp3',
        imagePath: 'assets/images/letter_a.png',
        estimatedDuration: const Duration(minutes: 10),
        tags: ['âm thanh', 'cơ bản'],
        exercises: [
          Exercise(
            id: 'ex_1_1',
            instruction: 'Nghe và nhắc lại âm "A"',
            expectedAnswer: 'A',
            audioPath: 'assets/audio/sound_a.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_1_2', 
            instruction: 'Tìm từ có chứa âm "A"',
            expectedAnswer: 'BA',
            choices: ['BA', 'CO', 'DE', 'FI'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_2',
        title: 'Âm "E" - Phát Âm Rõ Ràng',
        description: 'Thực hành phát âm chữ "E" chính xác',
        level: 1,
        audioPath: 'assets/audio/lesson_2.mp3',
        imagePath: 'assets/images/letter_e.png',
        estimatedDuration: const Duration(minutes: 10),
        tags: ['âm thanh', 'cơ bản'],
        exercises: [
          Exercise(
            id: 'ex_2_1',
            instruction: 'Phát âm "E" kéo dài',
            expectedAnswer: 'E',
            audioPath: 'assets/audio/sound_e.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_2_2',
            instruction: 'Chọn từ có âm "E"',
            expectedAnswer: 'BE',
            choices: ['BA', 'BE', 'BI', 'BO'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_3',
        title: 'Âm "I" - Tiếng Thật Hay',
        description: 'Luyện tập âm "I" trong tiếng Việt',
        level: 1,
        audioPath: 'assets/audio/lesson_3.mp3',
        imagePath: 'assets/images/letter_i.png',
        estimatedDuration: const Duration(minutes: 10),
        tags: ['âm thanh', 'cơ bản'],
        exercises: [
          Exercise(
            id: 'ex_3_1',
            instruction: 'Nói âm "I" thật rõ',
            expectedAnswer: 'I',
            audioPath: 'assets/audio/sound_i.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_4',
        title: 'Âm "O" - Tròn Như Trứng',
        description: 'Thành thạo âm "O" chuẩn',
        level: 1,
        audioPath: 'assets/audio/lesson_4.mp3',
        imagePath: 'assets/images/letter_o.png',
        estimatedDuration: const Duration(minutes: 10),
        tags: ['âm thanh', 'cơ bản'],
        exercises: [
          Exercise(
            id: 'ex_4_1',
            instruction: 'Phát âm "O" tròn tròn',
            expectedAnswer: 'O',
            audioPath: 'assets/audio/sound_o.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_5',
        title: 'Âm "U" - Ù Ù Vui Vẻ',
        description: 'Hoàn thiện bộ nguyên âm với "U"',
        level: 1,
        audioPath: 'assets/audio/lesson_5.mp3',
        imagePath: 'assets/images/letter_u.png',
        estimatedDuration: const Duration(minutes: 10),
        tags: ['âm thanh', 'cơ bản'],
        exercises: [
          Exercise(
            id: 'ex_5_1',
            instruction: 'Nói âm "U" kéo dài',
            expectedAnswer: 'U',
            audioPath: 'assets/audio/sound_u.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      // Bài 6-10: Phụ âm đơn (Level 2)
      Lesson(
        id: 'lesson_6',
        title: 'Chữ "B" - Ba, Bé, Báo',
        description: 'Học phát âm chữ B với từ đơn giản',
        level: 2,
        audioPath: 'assets/audio/lesson_6.mp3',
        imagePath: 'assets/images/letter_b.png',
        estimatedDuration: const Duration(minutes: 12),
        tags: ['phụ âm', 'từ đơn'],
        exercises: [
          Exercise(
            id: 'ex_6_1',
            instruction: 'Nói từ "BA"',
            expectedAnswer: 'BA',
            audioPath: 'assets/audio/word_ba.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_6_2',
            instruction: 'Nói từ "BÉ"', 
            expectedAnswer: 'BÉ',
            audioPath: 'assets/audio/word_be.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_6_3',
            instruction: 'Chọn từ bắt đầu bằng "B"',
            expectedAnswer: 'BÀO',
            choices: ['BÀO', 'CAO', 'DAO', 'GAO'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_7',
        title: 'Chữ "M" - Má, Mẹ, Mặt',
        description: 'Thực hành âm M quen thuộc',
        level: 2,
        audioPath: 'assets/audio/lesson_7.mp3',
        imagePath: 'assets/images/letter_m.png',
        estimatedDuration: const Duration(minutes: 12),
        tags: ['phụ âm', 'từ đơn'],
        exercises: [
          Exercise(
            id: 'ex_7_1',
            instruction: 'Gọi "MÁ"',
            expectedAnswer: 'MÁ',
            audioPath: 'assets/audio/word_ma.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_7_2',
            instruction: 'Nói "MẸ"',
            expectedAnswer: 'MẸ',
            audioPath: 'assets/audio/word_me.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_8',
        title: 'Chữ "C" - Cô, Cậu, Con',
        description: 'Luyện âm C trong gia đình',
        level: 2,
        audioPath: 'assets/audio/lesson_8.mp3',
        imagePath: 'assets/images/letter_c.png',
        estimatedDuration: const Duration(minutes: 12),
        tags: ['phụ âm', 'từ đơn'],
        exercises: [
          Exercise(
            id: 'ex_8_1',
            instruction: 'Gọi "CÔ"',
            expectedAnswer: 'CÔ',
            audioPath: 'assets/audio/word_co.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_8_2',
            instruction: 'Nói "CON"',
            expectedAnswer: 'CON',
            audioPath: 'assets/audio/word_con.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_9',
        title: 'Chữ "D" - Dê, Dao, Đá',
        description: 'Phân biệt D và Đ trong tiếng Việt',
        level: 2,
        audioPath: 'assets/audio/lesson_9.mp3',
        imagePath: 'assets/images/letter_d.png',
        estimatedDuration: const Duration(minutes: 12),
        tags: ['phụ âm', 'từ đơn'],
        exercises: [
          Exercise(
            id: 'ex_9_1',
            instruction: 'Nói "DÊ"',
            expectedAnswer: 'DÊ',
            audioPath: 'assets/audio/word_de.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_9_2',
            instruction: 'Chọn từ có âm "D"',
            expectedAnswer: 'DAO',
            choices: ['BAO', 'CAO', 'DAO', 'GAO'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_10',
        title: 'Chữ "G" - Gà, Gấu, Góc',
        description: 'Thành thạo âm G mạnh mẽ',
        level: 2,
        audioPath: 'assets/audio/lesson_10.mp3',
        imagePath: 'assets/images/letter_g.png',
        estimatedDuration: const Duration(minutes: 12),
        tags: ['phụ âm', 'từ đơn'],
        exercises: [
          Exercise(
            id: 'ex_10_1',
            instruction: 'Nói "GÀ"',
            expectedAnswer: 'GÀ',
            audioPath: 'assets/audio/word_ga.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_10_2',
            instruction: 'Nói "GẤU"',
            expectedAnswer: 'GẤU',
            audioPath: 'assets/audio/word_gau.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      // Bài 11-15: Từ đơn giản (Level 3)
      Lesson(
        id: 'lesson_11',
        title: 'Gọi Người Thân - Ba, Má, Ông, Bà',
        description: 'Học cách gọi các thành viên trong gia đình',
        level: 3,
        audioPath: 'assets/audio/lesson_11.mp3',
        imagePath: 'assets/images/family.png',
        estimatedDuration: const Duration(minutes: 15),
        tags: ['gia đình', 'từ vựng'],
        exercises: [
          Exercise(
            id: 'ex_11_1',
            instruction: 'Gọi "BA"',
            expectedAnswer: 'BA',
            audioPath: 'assets/audio/call_ba.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_11_2',
            instruction: 'Gọi "MÁ"',
            expectedAnswer: 'MÁ', 
            audioPath: 'assets/audio/call_ma.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_11_3',
            instruction: 'Chọn người trong gia đình',
            expectedAnswer: 'ÔNG',
            choices: ['ÔNG', 'BẠN', 'THẦY', 'BÁC'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_12',
        title: 'Đồ Vật Quen Thuộc',
        description: 'Tên các đồ vật hàng ngày',
        level: 3,
        audioPath: 'assets/audio/lesson_12.mp3',
        imagePath: 'assets/images/objects.png',
        estimatedDuration: const Duration(minutes: 15),
        tags: ['đồ vật', 'từ vựng'],
        exercises: [
          Exercise(
            id: 'ex_12_1',
            instruction: 'Nói "NƯỚC"',
            expectedAnswer: 'NƯỚC',
            audioPath: 'assets/audio/word_nuoc.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_12_2',
            instruction: 'Nói "CƠM"',
            expectedAnswer: 'CƠM',
            audioPath: 'assets/audio/word_com.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_13',
        title: 'Động Vật Dễ Thương',
        description: 'Tên các con vật quen thuộc',
        level: 3,
        audioPath: 'assets/audio/lesson_13.mp3',
        imagePath: 'assets/images/animals.png',
        estimatedDuration: const Duration(minutes: 15),
        tags: ['động vật', 'từ vựng'],
        exercises: [
          Exercise(
            id: 'ex_13_1',
            instruction: 'Nói "CHÓ"',
            expectedAnswer: 'CHÓ',
            audioPath: 'assets/audio/word_cho.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_13_2',
            instruction: 'Nói "MÈO"',
            expectedAnswer: 'MÈO',
            audioPath: 'assets/audio/word_meo.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_14',
        title: 'Màu Sắc Xinh Xắn',
        description: 'Học tên các màu cơ bản',
        level: 3,
        audioPath: 'assets/audio/lesson_14.mp3',
        imagePath: 'assets/images/colors.png',
        estimatedDuration: const Duration(minutes: 15),
        tags: ['màu sắc', 'từ vựng'],
        exercises: [
          Exercise(
            id: 'ex_14_1',
            instruction: 'Nói "ĐỎ"',
            expectedAnswer: 'ĐỎ',
            audioPath: 'assets/audio/word_do.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_14_2',
            instruction: 'Chọn màu xanh',
            expectedAnswer: 'XANH',
            choices: ['ĐỎ', 'VÀNG', 'XANH', 'TÍM'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_15',
        title: 'Số Đếm Vui Nhộn',
        description: 'Đếm từ 1 đến 10',
        level: 3,
        audioPath: 'assets/audio/lesson_15.mp3',
        imagePath: 'assets/images/numbers.png',
        estimatedDuration: const Duration(minutes: 15),
        tags: ['số đếm', 'từ vựng'],
        exercises: [
          Exercise(
            id: 'ex_15_1',
            instruction: 'Đếm "MỘT"',
            expectedAnswer: 'MỘT',
            audioPath: 'assets/audio/word_mot.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_15_2',
            instruction: 'Đếm "HAI"',
            expectedAnswer: 'HAI',
            audioPath: 'assets/audio/word_hai.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      // Bài 16-20: Câu ngắn (Level 4)
      Lesson(
        id: 'lesson_16',
        title: 'Chào Hỏi Lịch Sự',
        description: 'Học cách chào hỏi: "Con chào cô", "Cháu yêu ba"',
        level: 4,
        audioPath: 'assets/audio/lesson_16.mp3',
        imagePath: 'assets/images/greeting.png',
        estimatedDuration: const Duration(minutes: 18),
        tags: ['chào hỏi', 'câu ngắn'],
        exercises: [
          Exercise(
            id: 'ex_16_1',
            instruction: 'Nói câu "Con chào cô"',
            expectedAnswer: 'Con chào cô',
            audioPath: 'assets/audio/greeting_teacher.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_16_2',
            instruction: 'Nói câu "Cháu yêu ba"',
            expectedAnswer: 'Cháu yêu ba',
            audioPath: 'assets/audio/love_father.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_17',
        title: 'Xin Phép Lịch Sự',
        description: 'Học cách xin phép: "Con muốn..."',
        level: 4,
        audioPath: 'assets/audio/lesson_17.mp3',
        imagePath: 'assets/images/asking.png',
        estimatedDuration: const Duration(minutes: 18),
        tags: ['xin phép', 'câu ngắn'],
        exercises: [
          Exercise(
            id: 'ex_17_1',
            instruction: 'Nói "Con muốn nước"',
            expectedAnswer: 'Con muốn nước',
            audioPath: 'assets/audio/want_water.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_17_2',
            instruction: 'Nói "Con muốn ăn"',
            expectedAnswer: 'Con muốn ăn',
            audioPath: 'assets/audio/want_food.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_18',
        title: 'Cảm Ơn và Xin Lỗi',
        description: 'Học cách nói cảm ơn và xin lỗi',
        level: 4,
        audioPath: 'assets/audio/lesson_18.mp3',
        imagePath: 'assets/images/thankyou.png',
        estimatedDuration: const Duration(minutes: 18),
        tags: ['cảm ơn', 'câu ngắn'],
        exercises: [
          Exercise(
            id: 'ex_18_1',
            instruction: 'Nói "Cảm ơn cô"',
            expectedAnswer: 'Cảm ơn cô',
            audioPath: 'assets/audio/thank_you.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_18_2',
            instruction: 'Nói "Xin lỗi"',
            expectedAnswer: 'Xin lỗi',
            audioPath: 'assets/audio/sorry.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_19',
        title: 'Miêu Tả Đơn Giản',
        description: 'Học cách miêu tả: "Con thích...", "Con không thích..."',
        level: 4,
        audioPath: 'assets/audio/lesson_19.mp3',
        imagePath: 'assets/images/describing.png',
        estimatedDuration: const Duration(minutes: 18),
        tags: ['miêu tả', 'câu ngắn'],
        exercises: [
          Exercise(
            id: 'ex_19_1',
            instruction: 'Nói "Con thích chó"',
            expectedAnswer: 'Con thích chó',
            audioPath: 'assets/audio/like_dog.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_19_2',
            instruction: 'Chọn câu đúng',
            expectedAnswer: 'Con vui',
            choices: ['Con vui', 'Con bay', 'Con chạy', 'Con ngủ'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_20',
        title: 'Kể Chuyện Ngắn',
        description: 'Học kể chuyện đơn giản với 2-3 câu',
        level: 4,
        audioPath: 'assets/audio/lesson_20.mp3',
        imagePath: 'assets/images/storytelling.png',
        estimatedDuration: const Duration(minutes: 20),
        tags: ['kể chuyện', 'câu ngắn'],
        exercises: [
          Exercise(
            id: 'ex_20_1',
            instruction: 'Kể "Hôm nay con đi học"',
            expectedAnswer: 'Hôm nay con đi học',
            audioPath: 'assets/audio/story_school.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_20_2',
            instruction: 'Kể "Con chơi với bạn"',
            expectedAnswer: 'Con chơi với bạn',
            audioPath: 'assets/audio/story_friends.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      // Bài 21-25: Bài nâng cao
      Lesson(
        id: 'lesson_21',
        title: 'Hỏi Thăm Sức Khỏe',
        description: 'Học cách hỏi thăm: "Ba có khỏe không?"',
        level: 4,
        audioPath: 'assets/audio/lesson_21.mp3',
        imagePath: 'assets/images/health.png',
        estimatedDuration: const Duration(minutes: 20),
        tags: ['hỏi thăm', 'câu hỏi'],
        exercises: [
          Exercise(
            id: 'ex_21_1',
            instruction: 'Hỏi "Ba có khỏe không?"',
            expectedAnswer: 'Ba có khỏe không?',
            audioPath: 'assets/audio/ask_health.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_22',
        title: 'Hỏi Tên và Tuổi',
        description: 'Học cách tự giới thiệu',
        level: 4,
        audioPath: 'assets/audio/lesson_22.mp3',
        imagePath: 'assets/images/introduction.png',
        estimatedDuration: const Duration(minutes: 20),
        tags: ['giới thiệu', 'câu hỏi'],
        exercises: [
          Exercise(
            id: 'ex_22_1',
            instruction: 'Nói "Tên con là..."',
            expectedAnswer: 'Tên con là Bé',
            audioPath: 'assets/audio/my_name.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_23',
        title: 'Mô Tả Hoạt Động',
        description: 'Nói về những việc con làm',
        level: 4,
        audioPath: 'assets/audio/lesson_23.mp3',
        imagePath: 'assets/images/activities.png',
        estimatedDuration: const Duration(minutes: 20),
        tags: ['hoạt động', 'mô tả'],
        exercises: [
          Exercise(
            id: 'ex_23_1',
            instruction: 'Nói "Con đang ăn cơm"',
            expectedAnswer: 'Con đang ăn cơm',
            audioPath: 'assets/audio/eating_rice.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_24',
        title: 'Hỏi Đường',
        description: 'Học cách hỏi đường đơn giản',
        level: 4,
        audioPath: 'assets/audio/lesson_24.mp3',
        imagePath: 'assets/images/direction.png',
        estimatedDuration: const Duration(minutes: 20),
        tags: ['hỏi đường', 'giao tiếp'],
        exercises: [
          Exercise(
            id: 'ex_24_1',
            instruction: 'Hỏi "Nhà vệ sinh ở đâu?"',
            expectedAnswer: 'Nhà vệ sinh ở đâu?',
            audioPath: 'assets/audio/ask_toilet.mp3',
            type: ExerciseType.pronunciation,
          ),
        ],
      ),
      
      Lesson(
        id: 'lesson_25',
        title: 'Tổng Ôn và Thử Thách',
        description: 'Ôn tập tất cả kiến thức đã học',
        level: 4,
        audioPath: 'assets/audio/lesson_25.mp3',
        imagePath: 'assets/images/review.png',
        estimatedDuration: const Duration(minutes: 25),
        tags: ['ôn tập', 'tổng hợp'],
        exercises: [
          Exercise(
            id: 'ex_25_1',
            instruction: 'Kể về gia đình của con',
            expectedAnswer: 'Gia đình con có ba má và con',
            audioPath: 'assets/audio/family_story.mp3',
            type: ExerciseType.pronunciation,
          ),
          Exercise(
            id: 'ex_25_2',
            instruction: 'Chọn câu lịch sự nhất',
            expectedAnswer: 'Xin chào cô ạ',
            choices: ['Chào', 'Xin chào cô ạ', 'Ê cô', 'Cô ơi'],
            type: ExerciseType.multipleChoice,
          ),
        ],
      ),
    ];
  }
  
  static List<Lesson> getLessonsByLevel(int level) {
    return getAllLessons().where((lesson) => lesson.level == level).toList();
  }
  
  static Lesson? getLessonById(String id) {
    try {
      return getAllLessons().firstWhere((lesson) => lesson.id == id);
    } catch (e) {
      return null;
    }
  }
  
  static Map<int, String> getLevelNames() {
    return {
      1: '🔤 Cơ Bản - Âm Thanh',
      2: '📝 Trung Bình - Từ Đơn',
      3: '🗣️ Nâng Cao - Câu Ngắn', 
      4: '💬 Thành Thạo - Giao Tiếp',
    };
  }
  
  static Map<int, String> getLevelDescriptions() {
    return {
      1: 'Học các âm thanh cơ bản trong tiếng Việt (a, e, i, o, u)',
      2: 'Thực hành phụ âm và các từ đơn giản (ba, má, cô, chú)',
      3: 'Mở rộng từ vựng về gia đình, đồ vật, động vật',
      4: 'Học các câu ngắn và kỹ năng giao tiếp cơ bản',
    };
  }
}