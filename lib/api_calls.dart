import 'dart:convert';
import 'dart:developer';

import 'package:manuvs_calendar/common_utils/common_utils.dart';
import 'package:manuvs_calendar/constants/constants.dart';
import 'package:manuvs_calendar/internet_services/internet_connectivity.dart';
import 'package:manuvs_calendar/model_and_themes/custom_functions.dart';
import 'package:http/http.dart' as http;

class GetDataByDateCall {

  static Future<List<DataByDateStruct>> call({required String date}) async {
    if (ConnectivityService().connectionStatus()) {

      const url = Constants.LOCAL_ENDPOINT+'/getTransoformedDataByDate';
      // const url = Constants.ENDPOINT+'/getDataByDate'; // Replace with your actual API endpoint
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
        // Decode the response body as a List of JSON objects
        List<dynamic> jsonList = jsonDecode(response.body);

        // Convert each JSON object to a DataByDateStruct instance, handling nulls if needed
        List<DataByDateStruct> dataList = jsonList.map((json) {
          return DataByDateStruct.fromJson(json as Map<String, dynamic>);
        }).toList();

        return dataList;
      } else {
        // throw Exception('Failed to load data');

        List<DataByDateStruct> errorList = [];
        DataByDateStruct error = DataByDateStruct(id: -999, date: convertDateStringFormat(date), samvathsaram: "", ayanam: "", ruthuvu: "", maasam: "", month: "", day: "", paksham: "", thidhi: "", thidhi_to: "", thidhi_from: "", nakshatram: "", nakshatram_from: "", nakshatram_to: "", occasion: "", sunrise: "", sunset: "", error: "Internet Connection Not Found", thidhi_full: "", nakshatram_ful: "", samvathsaram_peru: "",
          ayanam_peru: "",
          ruthuvu_peru: "",
          month_peru: "",
          day_peru: "",
          maasam_peru: "",
          paksham_peru: "",
          thidhi_peru: "",
          nakshatram_peru: "",
          thidhi_from_en: "",
          thidhi_to_en: "",
          thidhi_from_te: "",
          thidhi_to_te: "",
          nakshatram_from_en: "",
          nakshatram_to_en: "",
          nakshatram_from_te: "",
          nakshatram_to_te: ""

        );
        errorList.add(error);
        return errorList;
      }
    }
    else {
      List<DataByDateStruct> errorList = [];
      DataByDateStruct error = DataByDateStruct(id: -999, date: convertDateStringFormat(date), samvathsaram: "", ayanam: "", ruthuvu: "", maasam: "", month: "", day: "", paksham: "", thidhi: "", thidhi_to: "", thidhi_from: "", nakshatram: "", nakshatram_from: "", nakshatram_to: "", occasion: "", sunrise: "", sunset: "", error: "Internet Connection Not Found", thidhi_full: "", nakshatram_ful: "", samvathsaram_peru: "",
          ayanam_peru: "",
          ruthuvu_peru: "",
          month_peru: "",
          day_peru: "",
          maasam_peru: "",
          paksham_peru: "",
          thidhi_peru: "",
          nakshatram_peru: "",
        thidhi_from_en: "",
        thidhi_to_en: "",
        thidhi_from_te: "",
        thidhi_to_te: "",
        nakshatram_from_en: "",
        nakshatram_to_en: "",
        nakshatram_from_te: "",
        nakshatram_to_te: ""

      );
      errorList.add(error);
      return errorList;
    }
  }
}
