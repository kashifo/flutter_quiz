import 'package:flutter/material.dart';
import 'package:flutterquiz/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = new QuizBrain();

class QuizPageV2 extends StatefulWidget {
  @override
  _QuizPageStateV2 createState() => _QuizPageStateV2();
}

class _QuizPageStateV2 extends State<QuizPageV2> {
  List<Widget> scoreKeeper = [];

  checkAnswer(bool isTrue) {
    setState(() {
      if (quizBrain.getAnwser() == isTrue) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.lightGreenAccent,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.redAccent,
        ));
      }

      if (!quizBrain.nextQuestion()) {
        showAlert();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '${quizBrain.questionNumber} / ${quizBrain.getNumOfQuestions()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
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
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(8),
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
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(8),
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
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Row(
              children: scoreKeeper,
            )),
      ],
    );
  }

  showAlert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Completed",
      desc: "You've successfully completed answering all the questions.",
      closeFunction: () {
        restartQuiz();
      },
      buttons: [
        DialogButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            restartQuiz();
          },
          width: 120,
        )
      ],
    ).show();
  }

  restartQuiz() {
    setState(() {
      quizBrain.questionNumber = 0;
      scoreKeeper = [];
    });
  }
}
