import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeColumn extends StatelessWidget {
  final void Function() switchScreen;

  const HomeColumn(switchFunction, {superKey})
      : switchScreen = switchFunction,
        super(key: superKey);

  @override
  Widget build(context) {
    return Container(
        color: Colors.purple,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Center(
                child: Image.asset('assets/images/quiz-logo.png',
                    width: 300, color: const Color.fromARGB(150, 255, 255, 255))),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text("Learn Flutter The Fun Way!",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )
                    )
                )
              ),
            Center(
              child: OutlinedButton.icon(
                  onPressed: switchScreen,
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text("Start Quiz!")
              ),
            )
          ]
        )
      )
    );
  }
}