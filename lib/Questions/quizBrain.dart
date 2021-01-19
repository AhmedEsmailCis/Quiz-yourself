import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('السعودية عاصمتها الخبر ؟', false),
    Question('شركة أبل هي الشركة المصنعة لأجهزة الايفون ؟', true),
    Question('اصغر ٌقارة في العالم هي أسيا؟', false),
    Question('تركيا تقع في قارتي أسيا وأوروبا معا؟َ', true),
    Question(' البرمائيات هي الكائنات التي تعيش في البر والماء؟', true),
    Question('الشكولاتة الداكنة تساعد على زيادة النشاط ؟', true),
    Question('دام حكم المسلمين للأندلس 20 سنة ؟', false),
    Question('الهيروغليفية هي لغة الإغريق ؟', false),
    Question('احتلت فلسطين من قبل الصهاينة عام 1948 م ؟', true),
    Question('ولد المسيح عيسى ابن مريم في دمشق ؟', false),
    Question('أطول نهر في العالم هو نهر النيل ؟', true),
    Question('عملة الأردن هي الليرة ؟', false),
    Question('اكثر الاحلام بين الناس هى السقوط من مكان عالى ؟', true),
    Question('ذكرت مريم العذراء في القرآن أكثر من الإنجيل ؟', true),
    Question('خالد أبن الوليد حامل لواء المسلمين ببدر و أحد ؟', false),
    Question('عدد لاعبى فريق كرة القدم 10 لاعباَ ؟', false),
    Question('المتر = 100 ديسمتر ؟ ', false),
    Question('اسم زوجة فرعون كان أسيا ؟', true),
    Question('معركة اجنادين حصلت بين المسلمين و البيزنطيين ؟', true),
    Question('ناسا هي أول محطة فضاء روسية', false)
  ];
  int getQuestionNumber() {
    int q = _questionNumber + 1;

    return q;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool checkTheEndQuiz() {
    if (_questionNumber == _questionBank.length - 1)
      return true;
    else
      return false;
  }

  void setToFirstQuestion() {
    _questionNumber = 0;
  }
}
