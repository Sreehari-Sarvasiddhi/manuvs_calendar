import 'package:flutter/material.dart';

export 'TextStyleWithOverride.dart';

// A custom class that allows overriding text styles
class TextStyleWithOverride extends TextStyle {
  const TextStyleWithOverride({
    super.fontSize,
    super.color,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.letterSpacing,
  });

  // Method to override TextStyle properties
  TextStyleWithOverride override({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? fontFamily,
    double? letterSpacing,
  }) {
    return TextStyleWithOverride(
      fontSize: fontSize ?? this.fontSize,
      color: color ?? this.color,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      fontFamily: fontFamily ?? this.fontFamily,
      letterSpacing: letterSpacing ?? this.letterSpacing,
    );
  }
}
