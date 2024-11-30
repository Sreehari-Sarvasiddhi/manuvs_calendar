import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:manuvs_calendar/home_page/home_page_widget.dart';
import 'package:manuvs_calendar/internet_services/internet_connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.systemLocale = 'en_US';
  await initializeDateFormatting('en_US'); // Initialize locale data for en_US
  checkInternetConnectivityOnIngite();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Extend the blue background into the status bar
      systemNavigationBarColor: Colors.white, // Extend the blue background into the navigation bar
    ),
  );
  runApp(const MyApp());
}

checkInternetConnectivityOnIngite(){
  var result =  Connectivity().checkConnectivity();
  ConnectivityService().setConnection( result == ConnectivityResult.mobile || result == ConnectivityResult.wifi);
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
      home: HomePageWidget(), // Use HomePageWidget as the home page
    );
  }
}