import 'dart:convert';
import 'dart:developer';

import 'package:manuvs_calendar/model_and_themes/custom_functions.dart';
import 'package:http/http.dart' as http;

class GetDataByDateCall {

  static Future<DataByDateStruct> call({required String date}) async {
    final url = 'http://13.232.191.159:8080/getDataByDate'; // Replace with your actual API endpoint
    // final url = 'http://192.168.186.2:8080/getDataByDate';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Accept, Authorization',
      'x-lang': 'EN'
    };
    final body = jsonEncode({
      'date': date,
    });

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      return DataByDateStruct.fromJson(jsonDecode(response.body,
       reviver: (key, value) {
       if (value == null) {
        return '';
       }
       return value;
      }));
    } else {
      throw Exception('Failed to load data');
    }
  }
  
}
