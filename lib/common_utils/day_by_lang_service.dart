enum DayByLang {
  m01("Sun", "ఆది"),
  m02("Mon", "సోమ"),
  m03("Tue", "మంగళ"),
  m04("Wed", "బుధ"),
  m05("Thu", "గురు"),
  m06("Fri", "శుక్ర"),
  m07("Sat", "శని");

  final String english;
  final String telugu;

  const DayByLang(this.english, this.telugu);

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
  static DayByLang? fromKey(String key) {
    try {
      return DayByLang.values.firstWhere((day) => day.name == ("m"+key));
    } catch (e) {
      return null;
    }
  }
}