import 'package:questions/question.dart';

class AppBrain {
  int _questionNumber = 0;
  final List<Question> _questionGrowb = [
    Question(
        q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
        i: 'images/image-1.jpg',
        a: true),
    Question(q: 'القطط هي حيوانات لاحمة', i: 'images/image-2.jpg', a: true),
    Question(
        q: "الصين موجودة في القارة الافريقية",
        i: 'images/image-3.jpg',
        a: false),
    Question(q: "الارض مسطحة وليست كروية", i: 'images/image-4.jpg', a: false),
    Question(
        q: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون اكل اللحوم',
        i: 'images/image-5.jpg',
        a: true),
    Question(
        q: 'الشمس تدور حول الارض والارض تدور حول القمر',
        i: 'images/image-6.jpg',
        a: false),
    Question(q: 'الحيوانات لاتشعر بالالم', i: 'images/image-7.jpg', a: false),
  ];

  String getQuestionText() {
    return _questionGrowb[_questionNumber].questionText;
  }

  String getquestionImage() {
    return _questionGrowb[_questionNumber].questionImage;
  }

  bool getquestionAnswer() {
    return _questionGrowb[_questionNumber].questionanswer;
  }

  nextQuestion() {
    if (_questionNumber < _questionGrowb.length - 1) {
      _questionNumber++;
    }
  }

  bool isFineshed() {
    if (_questionNumber >= _questionGrowb.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void rest() {
    _questionNumber = 0;
  }
}
