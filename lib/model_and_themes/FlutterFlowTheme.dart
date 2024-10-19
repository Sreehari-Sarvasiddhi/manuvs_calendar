import 'TextStyleWithOverride.dart';
import 'package:flutter/material.dart';

class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return FlutterFlowTheme();
  }

  // Utility colors
  Color get primaryText => const Color(0xFF14181B);
  Color get secondaryText => const Color(0xFF707d7d);
  Color get primaryBackground => const Color(0xFFd0d0d0);
  Color get secondaryBackground => const Color(0xFFffffff);


  // Brand colors
  Color get primary => const Color(0xFF4b39ef);
  Color get secondary => const Color(0xFF39d2c0);
  Color get teritiary => const Color(0xFFee8b60);
  Color get alternate => const Color(0xFFe0e3e7);

  // Semantic colors
  Color get success => const Color(0xFF249689);
  Color get error => const Color(0xFFff5963);
  Color get warning => const Color(0xFFf9cf58);
  Color get info => const Color(0xFFffffff);


  // Define text style with override support
  TextStyleWithOverride get bodyMedium => const TextStyleWithOverride(
    fontSize: 14,
    color: Color(0xFF14181B),
    fontWeight: FontWeight.normal,
  );

  // Define bodyMedium text style with override support
  TextStyleWithOverride get labelLarge => const TextStyleWithOverride(
    fontSize: 16,
    color: Color(0xFF14181B),
    fontWeight: FontWeight.normal,
  );

  TextStyleWithOverride get titleSmall => const TextStyleWithOverride(
    fontSize: 16,
    color: Color(0xFF14181B),
    fontWeight: FontWeight.w600, // semi bold
  );

  TextStyleWithOverride get labelMedium => const TextStyleWithOverride(
    fontSize: 14,
    color: Color(0xFF14181B),
    fontWeight: FontWeight.normal, // semi bold
  );

}
