import 'dart:convert';

import 'package:manuvs_calendar/constants/constants.dart';
import 'package:manuvs_calendar/internet_services/internet_connectivity.dart';
import 'package:http/http.dart' as http;

class GetLocationDataCall {
  static Future<List<LocationDataStruct>> call() async {
    // if (ConnectivityService().connectionStatus()) {
      const url = '${Constants.ENDPOINT}/allLocationData'; // Replace with your actual API endpoint
      // final url = 'http://192.168.186.2:8080/allLocationData';
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type, Accept, Authorization',
        'x-lang': 'EN'
      };

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        // Decode the response body as a List of JSON objects
        List<dynamic> jsonList = jsonDecode(response.body);

        // Convert each JSON object to a LocationDataStruct instance, handling nulls if needed
        List<LocationDataStruct> dataList = jsonList.map((json) {
          return LocationDataStruct.fromJson(json as Map<String, dynamic>);
        }).toList();

        return dataList;
      } else {
        throw Exception('Failed to load data');
      }
    }
    // else {
    //   List<LocationDataStruct> errorList = [];
    //   LocationDataStruct error = LocationDataStruct(id: -999,
    //       name: "",
    //       peru: "",
    //       time: 0,);
    //   errorList.add(error);
    //   return errorList;
    // }
  // }
}

class LocationDataStruct {
  int id;
  String name;
  String peru;
  int time;
  // String error;

  dynamic jsonBody;

  LocationDataStruct({
    required this.id,
    required this.time,
    required this.name,
    required this.peru,
    // required this.error
  });

  factory LocationDataStruct.fromJson(Map<String, dynamic> json) {
    return LocationDataStruct(
      id: json['id'],
      time: json['time'],
      name: json['name'],
      peru: json['peru'],
      // error: json['error']
    );
  }

  static LocationDataStruct? maybeFromMap(Map<String, dynamic> json) {
    if (json == null) return null;
    return LocationDataStruct.fromJson(json);
  }
}
