import 'package:flutter/material.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowTheme.dart';
// Function to show a SnackBar with a message
void showSnackBar(BuildContext context, String message, String type) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  Color bgColor = type == "error" ?  FlutterFlowTheme().error :  FlutterFlowTheme().success;
  Duration duration = type == "error" ? const Duration(days: 1) : const Duration(seconds: 3);
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),

    backgroundColor: bgColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16.0), // Adds a slight margin from the bottom and edges
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    duration: duration, // Duration for how long the SnackBar is visible
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}