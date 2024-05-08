//Get shuffled letters
List<String> getLetters(String word) {
  List<String> letters = word.split('');
  letters.shuffle();
  return letters;
}
