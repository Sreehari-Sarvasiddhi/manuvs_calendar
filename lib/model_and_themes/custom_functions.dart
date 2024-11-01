
// import 'lat_lng.dart';
// import 'place.dart';
// import 'uploaded_file.dart';
// import '/backend/schema/structs/index.dart';

// import 'dart:ffi';
List<CalendarDayStruct> getCalendarForMonth(DateTime inputDate) {
  List<CalendarDayStruct> calendar = [];

  // Start by finding the first day of the current month
  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Find the last day of the current month
  DateTime lastOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Adjust startCalendar to the nearest Sunday on or before the first day of the month
  DateTime startCalendar = firstOfMonth.subtract(Duration(days: firstOfMonth.weekday % 7));

  // Adjust endCalendar to the nearest Saturday on or after the last day of the month
  DateTime endCalendar = lastOfMonth.add(Duration(days: (6 - lastOfMonth.weekday) % 7));

  // Populate the calendar
  for (DateTime date = startCalendar;
  date.isBefore(endCalendar.add(const Duration(days: 1)));
  date = date.add(const Duration(days: 1))) {
    bool isPreviousMonth = date.isBefore(firstOfMonth);
    bool isNextMonth = date.isAfter(lastOfMonth);

    CalendarDayStruct dayStruct = CalendarDayStruct(
        date,
        isPreviousMonth,
        isNextMonth
    );

    calendar.add(dayStruct);
  }

  return calendar;
}


class CalendarDayStruct {

  CalendarDayStruct(DateTime date, bool isPreviousMonth, bool isNextmonth){
    calendarDate = date;
    this.isPreviousMonth = isPreviousMonth;
    isNextMonth = isNextmonth;
  }
  late DateTime calendarDate;
  late bool isPreviousMonth;
  late bool isNextMonth;
}

class DataByDateStruct {
  int id;
  String date;
  String samvathsaram;
  String ayanam;
  String ruthuvu;
  String maasam;
  String month;
  String day;
  String paksham;
  String thidhi;
  String thidhi_from;
  String thidhi_to;
  String nakshatram;
  String nakshatram_from;
  String nakshatram_to;
  
  String sunrise;
  String sunset;
  String occasion;
  String error;
  String thidhi_full;
  String nakshatram_ful;

  dynamic jsonBody;

  DataByDateStruct({
    required this.id,
    required this.date,
    required this.samvathsaram,
    required this.ayanam,
    required this.ruthuvu,
    required this.maasam,
    required this.month,
    required this.day,
    required this.paksham,
    required this.thidhi,
    required this.thidhi_to,
    required this.thidhi_from,
    required this.nakshatram,
    required this.nakshatram_from,
    required this.nakshatram_to,
    required this.occasion,
    required this.sunrise,
    required this.sunset,
    required this.error,
    required this.thidhi_full,
    required this.nakshatram_ful
  });

  

  factory DataByDateStruct.fromJson(Map<String, dynamic> json) {
    return DataByDateStruct(
      id: json['id'],
      date: json['date'],
      samvathsaram: json['samvathsaram'],
      ayanam: json['ayanam'],
      ruthuvu: json['ruthuvu'],
      maasam: json['maasam'],
      month: json['month'],
      day: json['day'],
      paksham: json['paksham'],
      thidhi: json['thidhi'],
      thidhi_from: json['thidhi_from'],
      thidhi_to: json['thidhi_to'],
      nakshatram: json['nakshatram'],
      nakshatram_from: json['nakshatram_from'],
      nakshatram_to: json['nakshatram_to'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      occasion: json['occasion'],
      error: json['error'],
      thidhi_full: json['thidhi_full'],
      nakshatram_ful: json['nakshatram_ful'],
    );
  }

  static DataByDateStruct? maybeFromMap(Map<String, dynamic> json) {
    if (json == null) return null;
    return DataByDateStruct.fromJson(json);
  }
}

DateTime getNextMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }
  return DateTime(year, month);
}

DateTime getLastMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }
  return DateTime(year, month);
}
