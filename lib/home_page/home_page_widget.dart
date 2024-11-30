import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manuvs_calendar/internet_services/internet_connectivity.dart';
import 'package:manuvs_calendar/language_toggle.dart';
import 'package:manuvs_calendar/location_dropdown/location_dropdown_widget.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowTheme.dart';
import 'package:manuvs_calendar/model_and_themes/flultter_flow_model.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart'
    as FlutterFlowHelpers;
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_icon_button.dart';
import 'package:manuvs_calendar/month_view_component/month_view_component_widget.dart';
import 'package:manuvs_calendar/model_and_themes/internationalization.dart';
import 'package:manuvs_calendar/model_and_themes/custom_functions.dart';
import 'package:manuvs_calendar/day_detail_component/day_detail_component_widget.dart';
import "package:manuvs_calendar/constants/constants.dart" as constants;
import 'package:toggle_switch/toggle_switch.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

import 'package:flutter/rendering.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: constants.Constants.homePageKey);

  @override
  State<HomePageWidget> createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    ConnectivityService().startMonitoring(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  void reloadContent() {
    setState(() {});
  }

  @override
  void dispose() {
    _model.dispose();
    ConnectivityService().stopMonitoring();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print("screen height :: ${screenSize.height}");
    print("screen width :: ${screenSize.width}");
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
    elevation: 16.0,
    child: Column(
    mainAxisSize: MainAxisSize.max,
    children: [ Column(
    mainAxisSize: MainAxisSize.max,
    children: [
    Padding(
    padding:
    EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    children: [
    Align(
    alignment: AlignmentDirectional(-1.0, -1.0),
    child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(
    15.0, 10.0, 0.0, 0.0),
    // child: FlutterFlowIconButton(
    // borderRadius: 8.0,
    // buttonSize: 41.0,
    // icon: Icon(
    // Icons.arrow_back,
    // color: FlutterFlowTheme.of(context).primaryText,
    // size: 24.0,
    // ),
    // ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(

                  'Pick a Language',

                style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.5,
                  fontSize: 16
                ),
              ),
              const ToggleButtonsExample(),
            ],
          ),
        ],
      ),
        ],),),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: screenSize.width,
                height: MediaQuery.of(context).size.height / 13.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 62.0,
                      icon: Icon(
                        Icons.menu,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    const Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: LocationDropDownWidget()),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  color: FlutterFlowTheme().secondaryBackground,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.monthViewComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MonthViewComponentWidget(
                          inputDate: getCurrentTimestamp,
                          onSelectDateAction: (selectedDate) async {
                            _model.selectedDate = selectedDate;
                            safeSetState(() {});
                          },
                        ),
                      ),
                      Wrap(
                        children: [
                          wrapWithModel(
                            model: _model.dayDetailComponentModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: DayDetailComponentWidget(
                              date: _model.selectedDate != null
                                  ? _model.selectedDate!
                                  : getCurrentTimestamp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
