import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/widgets/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.ans, {super.key});

  final List<String> ans;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> mp = [];
    for (int i = 0; i < ans.length; i++) {
      mp.add({
        'index': (i + 1).toString(),
        'question': questions[i].question,
        'correct_ans': questions[i].answers[0],
        'chosen_ans': ans[i],
      });
    }
    return mp;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    var numOfCorrect = summary.where((data) {
      return data['correct_ans'] == data['chosen_ans'];
    }).length;
    var numOfTtl = summary.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You  answered $numOfCorrect out of $numOfTtl Questions Correctly!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: QuestionSummary(getSummary()),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Quiz(),
                  ),
                );
              },
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
