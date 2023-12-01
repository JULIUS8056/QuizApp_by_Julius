import 'question.dart';

//This is a list containing questions. Each of the questions has defined in Question class has both questionText and questionAnswer
class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(q: 'Abuja is in Ghana', a: false),
    Question(
        q: 'Flutter can be used to develop mobile apps for both Android and iOS',
        a: true),
    Question(q: 'A variable name can start with a number', a: false),
    Question(q: 'Jesus is Lord', a: true),
    Question(q: 'Jesus has only 12 disciples', a: false),
    Question(q: 'Jesus is the Son of God', a: true),
    Question(q: 'My name is Juius', a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    if (_questionNumber < _questionBank.length) {
      return _questionBank[_questionNumber].questionText;
    } else {
      return 'No more questions';
    }
  }

  bool getQuestionAnswer() {
    if (_questionNumber < _questionBank.length) {
      return _questionBank[_questionNumber].questionAnswer;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  void clear() {
    _questionBank = [];
  }

  bool isFinished() {
    return _questionNumber + 1 == _questionBank.length;
  }

  int returnQuestionNumber() {
    return _questionBank.length;
  }
}
