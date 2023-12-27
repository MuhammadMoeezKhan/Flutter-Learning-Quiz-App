import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  const ResultsScreen(inputAnswers, {superKey})
      : chosenAnswers = inputAnswers,
        super(key: superKey);

  getQuizSummary() {
    Map<int, List<String>> quizSummary = {};
    int correctAnswer = 0;

    for (int i = 0; i < questions.length; i++) {
      quizSummary[i + 1] = [
        questions[i].question,
        chosenAnswers[i],
        questions[i].options[0]
      ];
      if (chosenAnswers[i] == questions[i].options[0]) {
        correctAnswer++;
      }
    }

    return [quizSummary, correctAnswer];
  }

  @override
  Widget build(BuildContext context) {
    final int numQuestions = questions.length;
    final quizData = getQuizSummary();
    int correctAnswers = quizData[1];
    //{questionNumber: [question, userSelection, correctAnswer]}

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("You got $correctAnswers out of $numQuestions right!",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          const SizedBox(height: 30),
          QuestionSummary(quizData[0]), 
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(),
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz!")),
        ]),
      ),
    );
  }
}
