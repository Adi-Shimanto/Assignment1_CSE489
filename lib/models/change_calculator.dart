class ChangeCalculator {

  static const List<int> noteDenominations = [500, 100, 50, 20, 10, 5, 2, 1];


  static Map<int, int> calculateChange(int amount) {
    Map<int, int> changeBreakdown = {};
    int remaining = amount;

    for (int note in noteDenominations) {
      if (remaining >= note) {
        int count = remaining ~/ note;
        changeBreakdown[note] = count;
        remaining %= note;
      } else {
        changeBreakdown[note] = 0;
      }
    }

    return changeBreakdown;
  }
}