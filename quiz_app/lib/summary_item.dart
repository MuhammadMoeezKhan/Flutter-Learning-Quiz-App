import 'package:flutter/material.dart';
import 'package:quiz_app/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final int questionNumber;
  final List<String> questionData;
  const SummaryItem(inputQNum, inputQData, {superKey})
      : questionNumber = inputQNum,
        questionData = inputQData,
        super(key: superKey);

  @override
  Widget build(BuildContext context) {
    String question = questionData[0];
    String userAnswer = questionData[1];
    String correctAnswer = questionData[2];

    bool isCorrect = userAnswer == correctAnswer;
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      QuestionIdentifier(questionNumber, isCorrect),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Opacity(
                opacity: 0.85,
                child: Text(userAnswer,
                    style: const TextStyle(color: Colors.grey, fontSize: 6))),
            const SizedBox(height: 5),
            Text(correctAnswer,
                style: const TextStyle(color: Colors.white, fontSize: 7)),
          ],
        ),
      )
    ]);
  }
}
