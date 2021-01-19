import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'QuizScreen.dart';

class QuizResult extends StatelessWidget {
  final int trueAnswerNumber;
  final int wrongAnswerNumber;
  QuizResult({this.trueAnswerNumber, this.wrongAnswerNumber});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "نتيجة الإختبار ",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 30,
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "خطــأ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${this.wrongAnswerNumber}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 30,
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "صـواب",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${this.trueAnswerNumber}",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return QuizPage();
                }));
              },
              child: Text(
                "إعادة الإختبار",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.lime,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                "خـــــــــــــروج",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.lime,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
