// Return the clicked letter from a word if it is a letter and not a special character
String? getClickedLetter(int index, List<String> letters) {
  String letter = letters[index];
  if (letter.isNotEmpty && letter != '-' && letter != '') {
    return letter;
  }
  return null;
}
