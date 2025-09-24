import 'package:info_compitation_app/Questions.dart';

class Questionslist {
  
final List<Question> _Questions = [
    Question(
      QuestionText: "عدد الكواكب في المجموعة الشمسية 8 كواكب",
      QuestionImage: "images/image-1.jpg",
      Answer: true,
    ),
    Question(
      QuestionText: "القطط حيوانات اليفة",
      QuestionImage: "images/image-2.jpg",
      Answer: true,
    ),
    Question(
      QuestionText: "الصين موجودة بالقارة الافريقية",
      QuestionImage: "images/image-3.jpg",
      Answer: false,
    ),
    Question(
      QuestionText: "الارض مسطحة وليست كروية",
      QuestionImage: "images/image-4.jpg",
      Answer: false,
    ),
    Question(
      QuestionText: "المشتري هو اكبر كواكب المجموعة الشمسية",
      QuestionImage: "images/image-5.jpg",
      Answer: true,
    ),
  ];
  List<Question> get Questionsgroup => _Questions;
}