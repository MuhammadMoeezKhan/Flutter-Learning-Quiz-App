import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screeen.dart';
import 'package:quiz_app/home_column.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

//Stateful Widget (Face Class)
class Quiz extends StatefulWidget {
  const Quiz({superKey}) : super(key: superKey);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//Stateful Widget (Back Class)
class _QuizState extends State<Quiz> {
  final List<String> userAnswers = [];
  var numQuestions = questions.length;
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = HomeColumn(onStartQuiz);
    super.initState();
  }

  //when an option is clicked
  void onOptionsSelect(answer) {
    userAnswers.add(answer);

    if (userAnswers.length == numQuestions) {
      setState(() {
        activeScreen = ResultsScreen(userAnswers);
      });
    }
  }

  //when the 'start quiz' button is clicked
  void onStartQuiz() {
    setState(() {
      activeScreen = QuestionsScreen(onOptionsSelect);
    });
  }

  //when the 'restart quiz' button is clicked
  void onRestartQuiz() {
    setState(() {
      userAnswers.clear();
      activeScreen = HomeColumn(onStartQuiz);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: const BoxDecoration(color: Colors.purple),
                child: activeScreen)));
  }
}
