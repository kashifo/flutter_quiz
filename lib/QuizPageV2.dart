import 'package:flutter/material.dart';
import 'package:flutterquiz/QuizBrain.dart';

QuizBrain quizBrain = new QuizBrain();

class QuizPageV2 extends StatefulWidget {
  @override
  _QuizPageStateV2 createState() => _QuizPageStateV2();
}

class _QuizPageStateV2 extends State<QuizPageV2> {
  List<Icon> scoreKeeper = [];
  int position = 0;

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
                //The user picked true.
                setState(() {
                  if (quizBrain.questionBank[position].answer) {
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

                  position++;
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
                //The user picked false.
                setState(() {
                  if (!quizBrain.questionBank[position].answer) {
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

                  position++;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
