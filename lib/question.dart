// ignore: empty_constructor_bodies
//This is a Question class with 2 properties of questionText and questionAnswer
//Each of the properties are initialised
class Question {
  String questionText = '';
  bool questionAnswer = true;

//This is the constructor of the Question class
  Question({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}
