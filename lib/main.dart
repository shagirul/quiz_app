import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: QuizHome())),
      ),
    );
  }
}

class QuizHome extends StatefulWidget {
  @override
  State<QuizHome> createState() => _QuizHomeState();
}

List<Question> Questionbank = [
  Question(q: "The incredible hulk was the first film in the MCU.", a: false),
  Question(
      q: "Nick Fury makes a cameo in The Incredible Hulk to ask Bruce if he wants to join the Avengers.",
      a: false),
  Question(
      q: "Miles Morales got his powers from  spider bite and not from the radiation exposure.",
      a: true),
  Question(q: "Black Widow's name is actually Natalia, not Natasha.", a: true),
  Question(
      q: "Charles Xavier became paralyzed after being shot by Wolverine.",
      a: false),
  Question(
      q: "Ego, Peter Quill's father, killed Meredith (Peter's mother) because she posed a distraction to his plans and so he could bring Peter to his planet.",
      a: true),
  Question(q: "Tony Stark is the richest Marvel character", a: false),
  Question(
      q: 'Groot has never said anything else apart from the phrase:“I am Groot”',
      a: false),
  Question(q: "Captain America is from Brooklyn", a: true),
  Question(q: "Tesseract first appear in the Thor movie", a: false),
  Question(q: "Tony Stark Married Pepper Potts", a: true),
  Question(
      q: "the MARK 1 is not the first armour that tony stark created",
      a: false),
  Question(
      q: "the MARK 1 is not the first armour that tony stark created",
      a: false),
];

class _QuizHomeState extends State<QuizHome> {
  int Qindex = 0;
  List<Icon> ScoreKeeper = [];
  void checkAnswer(bool userpickedAnswer) {
    bool correctAnswer = Questionbank[Qindex].questionAnswer;
    setState(() {
      if (Qindex >= 12) {
        Qindex = 0;
        ScoreKeeper = [];
        Alert(
          context: context,
          type: AlertType.error,
          title: "QUIZ ENDED",
          desc: "You have reached to last question",
          buttons: [
            DialogButton(
              child: Text(
                "RESET",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                // Qindex = 0;
                // ScoreKeeper = [];
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        if (userpickedAnswer == correctAnswer) {
          print("right");
          ScoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          print("wrong");
          ScoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
      Qindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                Questionbank[Qindex].questionText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  checkAnswer(true);
                },
                color: Colors.green,
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  checkAnswer(false);
                },
                color: Colors.red,
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ),
        Row(children: ScoreKeeper)
      ],
    );
  }
}
