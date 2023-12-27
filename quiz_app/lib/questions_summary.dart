import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  final Map<int, List<String>> quizSummary;

  const QuestionSummary(inputSummary, {superKey})
      : quizSummary = inputSummary,
        super(key: superKey);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
          children: quizSummary.entries.map((MapEntry<int, List<String>> entry) {
            int questionNumber = entry.key;
            List<String> questionData = entry.value;
            return SummaryItem(questionNumber, questionData);
          }).toList(), // Convert the map entries to a list of widgets
        ),
      ),
    );
  }
}