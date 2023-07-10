import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: summaryData.map((crnt) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: crnt['correct_ans'] == crnt['chosen_ans']
                    ? const Color.fromARGB(255, 120, 222, 123)
                    : const Color.fromARGB(255, 215, 103, 95),
                child: Text(
                  crnt['index'] as String,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crnt['question'] as String,
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      crnt['correct_ans'] as String,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 208, 145, 219)),
                    ),
                    Text(
                      crnt['chosen_ans'] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 213, 188, 225),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
