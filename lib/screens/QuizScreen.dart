import 'package:flutter/material.dart';
import 'ResultScreen.dart';
import '../Questions/quizBrain.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  QuizBrain Q = QuizBrain();
  int trueAnswerNumber = 0;
  int wrongAnswerNumber = 0;

  void checkAnswer(bool userTabButton) {
    setState(
      () {
        if (Q.getQuestionAnswer() == userTabButton) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          trueAnswerNumber++;
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
          wrongAnswerNumber++;
        }
        if (Q.checkTheEndQuiz()) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return QuizResult(
                  trueAnswerNumber: this.trueAnswerNumber,
                  wrongAnswerNumber: this.wrongAnswerNumber,
                );
              },
            ),
          );
        } else
          Q.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اختبــر نفســــك",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "السؤال رقم  ${Q.getQuestionNumber()}",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      Q.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.lime,
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
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'صواب',
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
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.red,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'خطأ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      checkAnswer(false);
                    },
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  children: scoreKeeper,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
