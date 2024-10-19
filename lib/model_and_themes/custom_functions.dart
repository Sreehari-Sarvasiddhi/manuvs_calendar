
// import 'lat_lng.dart';
// import 'place.dart';
// import 'uploaded_file.dart';
// import '/backend/schema/structs/index.dart';

List<CalendarDayStruct> getCalendarForMonth(DateTime inputDate) {
// NOTE: Since recording the episode it was spotted that the AI code which was
  // generated did not correctly support an additional row for months which Sunday
  // is the 1st day of the month. It resulted in the last line not being generated.
  // The code below replaces the AI code which was generated in Episode 2
  // Sorry for any confusion.

  List<CalendarDayStruct> calendar = [];

  // Start by finding the first day of the current month
  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Find the last day of the current month
  DateTime lastOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Find the first Monday on or before the first of the month
  DateTime startCalendar =
  firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));

  // Find the last Sunday after the end of the month
  DateTime endCalendar = lastOfMonth.weekday == 7
      ? lastOfMonth
      : lastOfMonth.add(Duration(days: 7 - lastOfMonth.weekday));

  // Populate the calendar
  for (DateTime date = startCalendar;
  date.isBefore(endCalendar.add(const Duration(days: 1)));
  date = date.add(const Duration(days: 1))) {
    bool isPreviousMonth = date.isBefore(firstOfMonth);
    bool isNextMonth = date.isAfter(lastOfMonth);

    CalendarDayStruct dayStruct = CalendarDayStruct(
        date,
        isPreviousMonth,
        isNextMonth);

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
