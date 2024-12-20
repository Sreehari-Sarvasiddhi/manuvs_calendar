import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:manuvs_calendar/internet_services/internet_connectivity.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowTheme.dart';
import 'package:manuvs_calendar/model_and_themes/flultter_flow_model.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart' as FlutterFlowHelpers;
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_icon_button.dart';
import 'package:manuvs_calendar/month_view_component/month_view_component_widget.dart';
import 'package:manuvs_calendar/model_and_themes/internationalization.dart';
import 'package:manuvs_calendar/model_and_themes/custom_functions.dart';
import 'package:manuvs_calendar/day_detail_component/day_detail_component_widget.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';


import 'package:flutter/rendering.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}
class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));

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
    ConnectivityService().startMonitoring(context);
    print("screen height :: ${screenSize.height}" );
    print("screen width :: ${screenSize.width}" );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          elevation: 16.0,
          backgroundColor: FlutterFlowTheme().secondaryBackground,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0,
                          10.0,
                          0.0,
                          0.0,
                        ),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 41.0,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            // context.safePop();
                            Navigator.of(context).pop();
                          },
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: screenSize.width,
                height: MediaQuery.of(context).size.height/13.5,
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
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 62.0,
                        fillColor: const Color(0x004B39EF),
                        icon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
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

