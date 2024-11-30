import 'package:manuvs_calendar/endpoint_calls/location_endpoint.dart';
import 'package:manuvs_calendar/language_toggle.dart';

class LocationSingletonData {
  static LocationSingletonData _instance = LocationSingletonData._();

  LocationSingletonData._() {
    _instance = this;
  }

  factory LocationSingletonData() {
    return _instance;
  }

  // properties and methods

 late LocationDataStruct selectedLocation;
 late Languages language;
}
