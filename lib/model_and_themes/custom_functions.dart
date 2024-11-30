
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

  String thidhi_from_en;
  String thidhi_to_en;
  String thidhi_from_te;
  String thidhi_to_te;

  String nakshatram_from_en;
  String nakshatram_to_en;
  String nakshatram_from_te;
  String nakshatram_to_te;

  String sunrise;
  String sunset;
  String occasion;
  String error;
  String thidhi_full;
  String nakshatram_ful;


  String samvathsaram_peru;
  String ayanam_peru;
  String ruthuvu_peru;
  String month_peru;
  String day_peru;
  String maasam_peru;
  String paksham_peru;
  String thidhi_peru;
  String nakshatram_peru;

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
    required this.nakshatram_ful,


    required this.nakshatram_from_en,
    required this.nakshatram_to_en,
    required this.nakshatram_from_te,
    required this.nakshatram_to_te,

    required this.thidhi_from_en,
    required this.thidhi_to_en,
    required this.thidhi_from_te,
    required this.thidhi_to_te,


    required this.samvathsaram_peru,
    required this.ayanam_peru,
    required this.ruthuvu_peru,
    required this.month_peru,
    required this.day_peru,
    required this.maasam_peru,
    required this.paksham_peru,
    required this.thidhi_peru,
    required this.nakshatram_peru,
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

      samvathsaram_peru: json['samvathsaram_peru'],
      ayanam_peru: json['ayanam_peru'],
      ruthuvu_peru: json['ruthuvu_peru'],
      month_peru: json['month_peru'],
      day_peru: json['day_peru'],
      maasam_peru: json['maasam_peru'],
      paksham_peru: json['paksham_peru'],
      thidhi_peru: json['thidhi_peru'],
      nakshatram_peru: json['nakshatram_peru'],

      nakshatram_from_en: json['nakshatram_from_en'],
      nakshatram_to_en: json['nakshatram_to_en'],
      nakshatram_from_te: json['nakshatram_from_te'],
      nakshatram_to_te: json['nakshatram_to_te'],

      thidhi_from_en: json['thidhi_from_en'],
      thidhi_to_en: json['thidhi_to_en'],
      thidhi_from_te: json['thidhi_from_te'],
      thidhi_to_te: json['thidhi_to_te']
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
