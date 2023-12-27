import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  final int questionNumber;
  final bool isCorrect;

  const QuestionIdentifier(inputQNumber, inputCorrect, {superKey})
      : questionNumber = inputQNumber,
        isCorrect = inputCorrect,
        super(key: superKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isCorrect ? Colors.green : Colors.red),
      child: Text(questionNumber.toString(), style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}
