import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: MyQuizHome()));
}

class MyQuizHome extends StatefulWidget {
  const MyQuizHome({super.key});

  @override
  State<MyQuizHome> createState() => _MyQuizHomeState();
}

class _MyQuizHomeState extends State<MyQuizHome> {
// List of Icons that store the results
  List<Icon> scoreCard = [];

  double totalCorrectAnswers = 0.0;
  double totalInCorrectAnswers = 0.0;
  double finalResult = 0.0;

// The function that reset the scoreCard
  void clear() {
    scoreCard = [];
  }

  void clearResult() {
    totalCorrectAnswers = 0.0;
    totalInCorrectAnswers = 0.0;
    finalResult = 0.0;
  }

// This function check if the user picked answer is correct
// Also test if the question is finished and the show alert and reset the quiz score
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if ((quizBrain.isFinished())) {
      //finalResult =(totalCorrectAnswers / quizBrain.returnQuestionNumber() * 100);
      /*setState(
        () {
          scoreCard.add(
            const Icon(Icons.check, color: Colors.green),
          );
        },
      );*/
      //double totalAnswer = totalCorrectAnswers;
      // finalResult;
      Alert(
        context: context,
        title: "End of the Quiz",
        desc: "Your score is $finalResult %",
        buttons: [
          DialogButton(
            child: const Text(
              "Try Again?",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            //onPressed: () => quizBrain.nextQuestion(),
            width: 120,
          )
        ],
      ).show();
    } else if (correctAnswer == userPickedAnswer) {
      setState(
        () {
          scoreCard.add(
            const Icon(Icons.check, color: Colors.green),
          );
          totalCorrectAnswers++;
          /*quizBrain.reset();
      clearResult();
      clear();*/
        },
      );

      //finalResult =(totalCorrectAnswers / quizBrain.returnQuestionNumber() * 100);
      //finalA = (totalCorrectAnswers / quizBrain.returnQuestionNumber() * 100);
      //finalA = finalA + finalResult;
      quizBrain.nextQuestion();
    } else {
      setState(
        () {
          scoreCard.add(
            const Icon(Icons.close, color: Colors.red),
          );
          totalInCorrectAnswers++;
        },
      );

      //finalA = (totalCorrectAnswers / quizBrain.returnQuestionNumber() * 100);
      //totalCorrectAnswers = totalCorrectAnswers;
      //finalResult =(totalCorrectAnswers / quizBrain.returnQuestionNumber() * 100);
      quizBrain.nextQuestion();
    }

    finalResult =
        (totalCorrectAnswers / quizBrain.returnQuestionNumber() * 100);
  }

  @override
  Widget build(BuildContext context) {
    //finalResult =(totalCorrectAnswers / quizBrain.returnQuestionNumber() * 100);
    //double finalA = finalResult;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BIBLE QUIZ')),
        ),
        body: SafeArea(
          child: Container(
            height: 1250,
            width: 25450,
            padding: const EdgeInsets.all(8.0),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          '$finalResult',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          '$totalCorrectAnswers',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          '$totalInCorrectAnswers',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Result',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Correct answers',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Wrong answers',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 200),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    color: Colors.white,
                    height: 450,
                    width: 450,
                    child: FittedBox(
                      fit: BoxFit.values[1],
                      child: Text(
                        quizBrain.getQuestionText(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 60.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        fixedSize: const Size.fromWidth(250)),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: const Text('True'),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        fixedSize: const Size.fromWidth(250)),
                    onPressed: () {
                      checkAnswer(false);
                      //finalA = finalResult;
                      //quizBrain.nextQuestion();
                    },
                    child: const Text('False'),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: scoreCard,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
