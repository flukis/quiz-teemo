class Question {
  const Question(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledLists = List.of(answers);
    shuffledLists.shuffle();
    return shuffledLists;
  }
}
