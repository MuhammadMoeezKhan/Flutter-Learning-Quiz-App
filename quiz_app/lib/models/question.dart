class Question {
  final String question;
  final List<String> options;

  const Question(inputQuestion, inputOptions)
      : question = inputQuestion,
        options = inputOptions;

  List<String> shuffleOptions() {
    final shuffledOptions = List.of(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }
}