import 'package:manuvs_calendar/model_and_themes/flultter_flow_model.dart';
import 'package:manuvs_calendar/month_day_component/month_day_component_model.dart';
import 'month_view_component_widget.dart' show MonthViewComponentWidget;
import 'package:flutter/material.dart';

class MonthViewComponentModel
    extends FlutterFlowModel<MonthViewComponentWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  DateTime? inputDate;

  ///  State fields for stateful widgets in this component.

  // Model for MonthDayComponent component.
  late MonthDayComponentModel monthDayComponentModel1;
  // Model for MonthDayComponent component.
  late MonthDayComponentModel monthDayComponentModel2;
  // Model for MonthDayComponent component.
  late MonthDayComponentModel monthDayComponentModel3;
  // Model for MonthDayComponent component.
  late MonthDayComponentModel monthDayComponentModel4;
  // Model for MonthDayComponent component.
  late MonthDayComponentModel monthDayComponentModel5;
  // Model for MonthDayComponent component.
  late MonthDayComponentModel monthDayComponentModel6;
  // Model for MonthDayComponent component.
  late MonthDayComponentModel monthDayComponentModel7;

  @override
  void initState(BuildContext context) {
    monthDayComponentModel1 =
        createModel(context, () => MonthDayComponentModel());
    monthDayComponentModel2 =
        createModel(context, () => MonthDayComponentModel());
    monthDayComponentModel3 =
        createModel(context, () => MonthDayComponentModel());
    monthDayComponentModel4 =
        createModel(context, () => MonthDayComponentModel());
    monthDayComponentModel5 =
        createModel(context, () => MonthDayComponentModel());
    monthDayComponentModel6 =
        createModel(context, () => MonthDayComponentModel());
    monthDayComponentModel7 =
        createModel(context, () => MonthDayComponentModel());
  }

  @override
  void dispose() {
    monthDayComponentModel1.dispose();
    monthDayComponentModel2.dispose();
    monthDayComponentModel3.dispose();
    monthDayComponentModel4.dispose();
    monthDayComponentModel5.dispose();
    monthDayComponentModel6.dispose();
    monthDayComponentModel7.dispose();
  }
}
