import 'package:manuvs_calendar/common_utils/common_utils.dart';
import 'package:manuvs_calendar/language_toggle.dart';
import 'package:manuvs_calendar/model_and_themes/custom_functions.dart';

String getThidhiByLang(DataByDateStruct obj) {
  return getInitialLang() == Languages.telugu
      ? obj.thidhi_to_te
      : obj.thidhi_to_en;
  // return obj.thidhi_to;
}

String getNakshatramByLang(DataByDateStruct obj) {
  return getInitialLang() == Languages.telugu
      ? obj.nakshatram_to_te
      : obj.nakshatram_to_en;

  // return obj.nakshatram_to;
}


String getAllDayByLang(DataByDateStruct obj) {
  return getInitialLang() == Languages.telugu
      ? "పూర్తి"
      : "All Day";
}
