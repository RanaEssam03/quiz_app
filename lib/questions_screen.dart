import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer_widget.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.addAns,{super.key});
  final void Function(String str) addAns;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var crntIndx = 0;
  void changeQuestion(String str) {
    widget.addAns(str);
    setState(() {
      crntIndx++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestions = questions[crntIndx];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ...currentQuestions.getShuffledList().map((question) {
              return AnswerWidget(
                ans: question,
                fun: changeQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
