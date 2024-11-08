import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manuvs_calendar/constants/constants.dart';
import 'package:manuvs_calendar/endpoint_calls/location_endpoint.dart';
import 'package:manuvs_calendar/home_page/home_page_model.dart';
import 'package:manuvs_calendar/home_page/home_page_widget.dart';
import 'package:manuvs_calendar/location_dropdown/location_singleton.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowDropDown.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowTheme.dart';
import 'package:manuvs_calendar/model_and_themes/FormFieldController.dart';
import 'package:manuvs_calendar/model_and_themes/flultter_flow_model.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart';
import 'package:manuvs_calendar/common_utils/common_utils.dart' as common_utils;
import 'package:provider/provider.dart';

import 'location_dropdown_model.dart';
export 'location_dropdown_model.dart';

class LocationDropDownWidget extends StatefulWidget {
  const LocationDropDownWidget({super.key});

  @override
  State<LocationDropDownWidget> createState() => _LocationDropDownWidgetState();
}

class _LocationDropDownWidgetState extends State<LocationDropDownWidget> {
  late LocationDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationDropDownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LocationDataStruct>>(
      future: GetLocationDataCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).tertiary,
                ),
              ),
            ),
          );
        }
        final containerLocationAPIResponse = snapshot.data!;

        return Container(
          width: 220.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController ??=
                FormFieldController<String>(
                  _model.dropDownValue ??= common_utils.toSentenceCase((containerLocationAPIResponse
                      .map<LocationDataStruct?>(
                      (locationDataStruct) => locationDataStruct)
                      .toList() as Iterable<LocationDataStruct?>)
                      .withoutNulls
                      .first
                      .name),
                ),
            options: (containerLocationAPIResponse
                .map<LocationDataStruct?>(
                (locationDataStruct) => locationDataStruct)
                .toList() as Iterable<LocationDataStruct?>)
                .withoutNulls
                .map((e) => common_utils.toSentenceCase(e!.name))
                .toList(),
            onChanged: (val)  {
                final selectedLocation = containerLocationAPIResponse.firstWhere((location) => common_utils.toSentenceCase(location.name) == val);
                LocationSingletonData().selectedLocation = selectedLocation;
                safeSetState(() => _model.dropDownValue = val);
                Constants.homePageKey.currentState?.reloadContent();
            },
            width: 220.0,
            height: 40.0,
            searchHintTextStyle:
            FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              letterSpacing: 0.0,
            ),
            hintText: "Select...",
            searchHintText: "Search...",
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 2.0,
            borderColor: Colors.transparent,
            borderWidth: 0.0,
            borderRadius: 8.0,
            margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            hidesUnderline: true,
            isOverButton: false,
            isSearchable: true,
            isMultiSelect: false,
          ),
        );
      },
    );
  }
}
