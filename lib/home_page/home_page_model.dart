import 'package:manuvs_calendar/day_detail_component/day_detail_component_model.dart';
import 'package:manuvs_calendar/home_page/home_page_widget.dart';
import 'package:manuvs_calendar/model_and_themes/flultter_flow_model.dart';
import 'package:manuvs_calendar/month_view_component/month_view_component_model.dart';

import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // Model for MonthViewComponent component.
  late MonthViewComponentModel monthViewComponentModel;
  // Model for DayDetailComponent component.
  late DayDetailComponentModel dayDetailComponentModel;

  @override
  void initState(BuildContext context) {
    monthViewComponentModel =
        createModel(context, () => MonthViewComponentModel());
    dayDetailComponentModel =
        createModel(context, () => DayDetailComponentModel());
  }

  @override
  void dispose() {
    monthViewComponentModel.dispose();
    dayDetailComponentModel.dispose();
  }
}
