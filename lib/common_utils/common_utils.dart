import 'package:intl/intl.dart';

String toSentenceCase(String text) {
  if (text.isEmpty) return text;

  return text
      .split(' ')
      .map((word) => word.isEmpty
      ? ''
      : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
      .join(' ');
}

String convertStringtoDate(String dateString) {
  if(dateString != "") {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = formatDateWithOrdinal(
        dateTime); //DateFormat('MMMMd hh:ss').format(dateTime);
    return formattedDate;
  }
  return "";
}

String formatDateWithOrdinal(DateTime dateTime) {
  String monthDay = DateFormat('MMM d').format(dateTime); // "Sept 7"
  String hourMinute = DateFormat('HH:mm').format(dateTime); // "22:48"

  // Get day of the month and add ordinal suffix
  String dayWithSuffix = '${getOrdinalSuffix(dateTime.day)}';

  return '$monthDay$dayWithSuffix, $hourMinute';
}
String getOrdinalSuffix(int day) {
  if (day >= 11 && day <= 13) return 'th';
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}


String convertTimeFormat(String time){
  DateTime dateTime = DateFormat("HH:mm:ss").parse(time);
  String formattedTime = DateFormat("HH:mm").format(dateTime);

  return formattedTime;
}

String convertDateStringFormat(String date){
  DateTime dateTime = DateFormat("yyyy/MM/dd").parse(date);
  String formattedTime = DateFormat("yyyy-MM-dd").format(dateTime);
  return formattedTime;
}
