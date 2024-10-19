import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:manuvs_calendar/home_page/home_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.systemLocale = 'en_US';
  await initializeDateFormatting('en_US'); // Initialize locale data for en_US
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ... (rest of the theme configuration remains the same)
      ),
      home: const HomePageWidget(), // Use HomePageWidget as the home page
    );
  }
}