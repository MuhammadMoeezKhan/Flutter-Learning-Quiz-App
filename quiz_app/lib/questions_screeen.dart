import 'package:flutter/material.dart';
import 'package:quiz_app/option_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String option) onButtonClick;

  const QuestionsScreen(inputFunction, {superKey})
      : onButtonClick = inputFunction,
        super(key: superKey);

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  progressQuestionIndex(String option) {
    widget.onButtonClick(option);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffleOptions().map((option) {
              return OptionsButton(option, () {
                progressQuestionIndex(option);
              });
            })
          ],
        ),
      ),
    );
  }
}
