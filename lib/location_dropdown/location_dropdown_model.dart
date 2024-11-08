import 'package:manuvs_calendar/model_and_themes/FormFieldController.dart';
import 'package:manuvs_calendar/model_and_themes/flultter_flow_model.dart';

import 'location_dropdown_widget.dart' show LocationDropDownWidget;
import 'package:flutter/material.dart';

class LocationDropDownModel extends FlutterFlowModel<LocationDropDownWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
