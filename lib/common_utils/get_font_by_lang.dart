

import 'package:manuvs_calendar/common_utils/common_utils.dart';
import 'package:manuvs_calendar/language_toggle.dart';

String getFontFamily(){
  return  getInitialLang() == Languages.telugu ? "Gautami" : "Inter";
}