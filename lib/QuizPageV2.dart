import 'package:flutter/material.dart';
import 'package:flutterquiz/QuizBrain.dart';

QuizBrain quizBrain = new QuizBrain();

class QuizPageV2 extends StatefulWidget {
  @override
  _QuizPageStateV2 createState() => _QuizPageStateV2();
}

class _QuizPageStateV2 extends State<QuizPageV2> {
  int position = 0;

  checkAnswer(bool isTrue) {
    if (quizBrain.questionBank[position].answer == isTrue) {
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

    if (position < quizBrain.questionBank.length) {
      position++;
    } else {
      //todo: learn to hide views.
    }
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
                '$position / ${quizBrain.questionBank.length}',
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
                quizBrain.questionBank[position].question,
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
                //The user picked true.
                setState(() {
                  checkAnswer(true);
                });
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
                //The user picked false.
                setState(() {
                  checkAnswer(false);
                });
              },
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: ListView(
              children: scoreKeeper,
            )),
      ],
    );
  }

  List<Widget> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.lightGreenAccent,
    ),
    Icon(
      Icons.close,
      color: Colors.redAccent,
    )
  ];
}
