import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

int questionNumber = 0;

List<Icon> scoreKeeper = [];

void addTrue() {
  scoreKeeper.add(
    Icon(
      Icons.check,
      color: Colors.green,
    ),
  );
}

void addFalse() {
  scoreKeeper.add(
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  );
}

List<Questions> questions = [
  Questions(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  Questions(
      q: 'Approximately one quarter of human bones are in the feet.', a: true),
  Questions(q: 'A slug\'s blood is green.', a: true),
];

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = questions[questionNumber].questionAnswer;

                if (correctAnswer == true) {
                  print('User Got it');
                } else {
                  print('user did not got it');
                }
                setState(() {
                  questionNumber++;
                  addTrue();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = questions[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  print('User Got it');
                } else {
                  print('user did not got it');
                }
                setState(() {
                  questionNumber++;
                  addFalse();
                });
              },
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
