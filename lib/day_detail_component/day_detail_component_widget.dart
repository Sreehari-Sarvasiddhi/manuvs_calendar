import 'package:manuvs_calendar/common_utils/common_utils.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowTheme.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart';
import 'package:manuvs_calendar/model_and_themes/internationalization.dart';
import 'package:manuvs_calendar/model_and_themes/custom_functions.dart';
import 'package:manuvs_calendar/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:manuvs_calendar/common_utils/common_utils.dart';

import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'day_detail_component_model.dart';
export 'day_detail_component_model.dart';

class DayDetailComponentWidget extends StatefulWidget {
  const DayDetailComponentWidget({
    super.key,
    required this.date,
  });

  final DateTime? date;

  @override
  State<DayDetailComponentWidget> createState() =>
      _DayDetailComponentWidgetState();
}

class _DayDetailComponentWidgetState extends State<DayDetailComponentWidget> {
  late DayDetailComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayDetailComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height/3,
      decoration: BoxDecoration(color: FlutterFlowTheme().secondaryBackground),
      child: FutureBuilder<List<DataByDateStruct>>(
        future: GetDataByDateCall.call(
          date: dateTimeFormat(
            "yyyy/MM/dd",
            widget.date,
            locale: FFLocalizations.of(context).languageCode,
          ),
        ),
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
          final columnGetDataByDateResponse = snapshot.data!;

          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  if ( columnGetDataByDateResponse.isNotEmpty && columnGetDataByDateResponse.first.error == '' ) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                      const AlignmentDirectional(-1.0, -1.0),
                                      child: Text(
                                        dateTimeFormat(
                                          "MMMMEEEEd",
                                          DateTime.parse(columnGetDataByDateResponse.first.date),
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                          fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    toSentenceCase(
                                    columnGetDataByDateResponse.first.samvathsaram),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                      fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                  toSentenceCase(
                                    columnGetDataByDateResponse.first.ayanam),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                      fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    toSentenceCase(
                                    columnGetDataByDateResponse.first.ruthuvu),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                      fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    toSentenceCase(
                                    columnGetDataByDateResponse.first.maasam),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                      fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    toSentenceCase(
                                    columnGetDataByDateResponse.first.paksham),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                      fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      toSentenceCase(
                                      columnGetDataByDateResponse.first.thidhi),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                        (columnGetDataByDateResponse.first.thidhi_full == "1") ? "All Day" :
                                        convertStringtoDate(convertByDesantharaKaalamDateTime(columnGetDataByDateResponse.first.thidhi_to)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              if (columnGetDataByDateResponse.length == 2)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        toSentenceCase(columnGetDataByDateResponse.elementAt(1).thidhi),
                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        (columnGetDataByDateResponse.first.thidhi_full == "1")
                                            ? "All Day"
                                            : convertStringtoDate(convertByDesantharaKaalamDateTime(columnGetDataByDateResponse.elementAt(1).thidhi_to)),
                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                          fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      toSentenceCase(
                                      columnGetDataByDateResponse.first.nakshatram),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                        (columnGetDataByDateResponse.first.nakshatram_ful == "1") ? "All Day" :
                                        convertStringtoDate(convertByDesantharaKaalamDateTime(columnGetDataByDateResponse.first.nakshatram_to)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                  12.0, 5.0, 12.0, 0.0),
                  child:
                  Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.sunrise,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                                    Text(
                                        convertTimeFormat(convertByDesantharaKaalamTime(columnGetDataByDateResponse.first.sunrise)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,

                                  children: [
                                    Icon(
                                      CupertinoIcons.sunset,
                                      // Icons.wb_sunny_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                                    Text(
                                      convertTimeFormat(convertByDesantharaKaalamTime(columnGetDataByDateResponse.first.sunset)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                            ),
                      ],
                    );
                  } else {
                    return
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Could not retrieve Daily Data for ${dateTimeFormat(
                                        "MMMMd",
                                        DateTime.parse(columnGetDataByDateResponse.first.date),
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        color: FlutterFlowTheme().secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Please try again later!!",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        color: FlutterFlowTheme().secondaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}