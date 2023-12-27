import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsButton extends StatelessWidget {
  final String optionText;
  final void Function() onTap;

  const OptionsButton(inputOptionText, inputFunction, {superKey})
      : optionText = inputOptionText,
        onTap = inputFunction,
        super(key: superKey);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          backgroundColor: const Color.fromARGB(255, 50, 3, 82),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(optionText, style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ), textAlign: TextAlign.center)
    );
  }
}