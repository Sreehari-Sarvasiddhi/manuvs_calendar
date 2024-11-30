enum MonthByLang {
  m01("January", "జనవరి"),
  m02("February", "ఫిబ్రవరి"),
  m03("March", "మార్చ్"),
  m04("April", "ఏప్రిల్"),
  m05("May", "మే"),
  m06("June", "జూన్"),
  m07("July", "జులై"),
  m08("August", "ఆగష్టు"),
  m09("September", "సెప్టెంబర్"),
  m10("October", "అక్టోబర్"),
  m11("November", "నవంబర్"),
  m12("December", "డిసెంబర్");

  final String english;
  final String telugu;

  const MonthByLang(this.english, this.telugu);

  // Method to get the month name based on the language
  String getMonthName(String language) {
    switch (language.toLowerCase()) {
      case "english":
        return english;
      case "telugu":
        return telugu;
      default:
        throw ArgumentError("Unsupported language: $language");
    }
  }

  // Method to find a Month by key
  static MonthByLang? fromKey(String key) {
    try {
      return MonthByLang.values.firstWhere((month) => month.name == ("m"+key));
    } catch (e) {
      return null;
    }
  }
}