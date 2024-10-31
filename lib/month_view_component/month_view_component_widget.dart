
import 'package:google_fonts/google_fonts.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowTheme.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_icon_button.dart';
import 'package:manuvs_calendar/model_and_themes/internationalization.dart';
import 'package:manuvs_calendar/month_day_component/month_day_component_widget.dart';

import 'package:manuvs_calendar/model_and_themes//custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'month_view_component_model.dart';
export 'month_view_component_model.dart';

class MonthViewComponentWidget extends StatefulWidget {
  const MonthViewComponentWidget({
    super.key,
    required this.inputDate,
    this.initialSelectedDate,
    this.onSelectDateAction,
  });

  final DateTime? inputDate;
  final DateTime? initialSelectedDate;
  final Future Function(DateTime selectedDate)? onSelectDateAction;

  @override
  State<MonthViewComponentWidget> createState() =>
      _MonthViewComponentWidgetState();
}

class _MonthViewComponentWidgetState extends State<MonthViewComponentWidget> {
  late MonthViewComponentModel _model;
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthViewComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.inputDate = widget.inputDate;
      safeSetState(() {});
      if (widget.initialSelectedDate != null) {
        _model.selectedDate = widget.initialSelectedDate;
        safeSetState(() {});
      }
    });

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
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      dateTimeFormat(
                        "MMMM",
                        _model.inputDate,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      dateTimeFormat(
                        "y",
                        _model.inputDate,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ].divide(const SizedBox(width: 7.0)),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 14.0,
                    ),
                    onPressed: () async {
                      _model.inputDate =
                          functions.getLastMonthDateTime(_model.inputDate!);
                      safeSetState(() {});
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 14.0,
                    ),
                    onPressed: () async {
                      _model.inputDate =
                          functions.getNextMonthDateTime(_model.inputDate!);
                      safeSetState(() {});
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.today,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      _model.inputDate = getCurrentTimestamp;
                      _model.selectedDate = getCurrentTimestamp;
                      safeSetState(() {});
                      await widget.onSelectDateAction?.call(
                        _model.selectedDate!,
                      );
                    },
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ].addToStart(const SizedBox(width: 24.0)).addToEnd(const SizedBox(width: 24.0)),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(19.0, 0.0, 19.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wrapWithModel(
                  model: _model.monthDayComponentModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: const MonthDayComponentWidget(
                    day: 'Sun',
                  ),
                ),
                wrapWithModel(
                  model: _model.monthDayComponentModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: const MonthDayComponentWidget(
                    day: 'Mon',
                  ),
                ),
                wrapWithModel(
                  model: _model.monthDayComponentModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: const MonthDayComponentWidget(
                    day: 'Tue',
                  ),
                ),
                wrapWithModel(
                  model: _model.monthDayComponentModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: const MonthDayComponentWidget(
                    day: 'Wed',
                  ),
                ),
                wrapWithModel(
                  model: _model.monthDayComponentModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: const MonthDayComponentWidget(
                    day: 'Thu',
                  ),
                ),
                wrapWithModel(
                  model: _model.monthDayComponentModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: const MonthDayComponentWidget(
                    day: 'Fri',
                  ),
                ),
                wrapWithModel(
                  model: _model.monthDayComponentModel7,
                  updateCallback: () => safeSetState(() {}),
                  child: const MonthDayComponentWidget(
                    day: 'Sat',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height/3,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(19.0, 0.0, 19.0, 0.0),
              child: Builder(
                builder: (context) {
                  final calendar =
                  functions.getCalendarForMonth(_model.inputDate ?? DateTime.now()).toList();
                  print(" calendar length :: "+ calendar.length.toString());
                  double mainAxisSpacing = 14.0;

                  if(calendar.length / 7 == 6){
                    mainAxisSpacing = 10.0;
                  }
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 18.0,
                      mainAxisSpacing: mainAxisSpacing,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: calendar.length,
                    itemBuilder: (context, calendarIndex) {
                      final calendarItem = calendar[calendarIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.selectedDate = calendarItem.calendarDate;
                          safeSetState(() {});
                          await widget.onSelectDateAction?.call(
                            _model.selectedDate!,
                          );
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: dateTimeFormat(
                              "d/M/y",
                              calendarItem.calendarDate,
                              locale: FFLocalizations.of(context)
                                  .languageCode,
                            ) ==
                                dateTimeFormat(
                                  "d/M/y",
                                  _model.selectedDate,
                                  locale: FFLocalizations.of(context)
                                      .languageCode,
                                )
                                ? FlutterFlowTheme.of(context).primary
                                : const Color(0x00000000),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: dateTimeFormat(
                                "d/M/y",
                                calendarItem.calendarDate,
                                locale: FFLocalizations.of(context)
                                    .languageCode,
                              ) ==
                                  dateTimeFormat(
                                    "d/M/y",
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )
                                  ? FlutterFlowTheme.of(context).primary
                                  : const Color(0x00000000),
                              width: 0.8,
                            ),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                              "d",
                              dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                                calendarItem.calendarDate.secondsSinceEpoch,
                                0,
                              )),
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: FlutterFlowTheme().primaryFont.fontFamily,
                              color: calendarItem.isPreviousMonth ||
                                  calendarItem.isNextMonth
                                  ? (dateTimeFormat(
                                "d/M/y",
                                calendarItem.calendarDate,
                                locale:
                                FFLocalizations.of(context)
                                    .languageCode,
                              ) ==
                                  dateTimeFormat(
                                    "d/M/y",
                                    _model.selectedDate,
                                    locale:
                                    FFLocalizations.of(context)
                                        .languageCode,
                                  )
                                  ? FlutterFlowTheme.of(context)
                                  .alternate
                                  : FlutterFlowTheme.of(context)
                                  .secondaryText)
                                  : (dateTimeFormat(
                                "d/M/y",
                                calendarItem.calendarDate,
                                locale:
                                FFLocalizations.of(context)
                                    .languageCode,
                              ) ==
                                  dateTimeFormat(
                                    "d/M/y",
                                    _model.selectedDate,
                                    locale:
                                    FFLocalizations.of(context)
                                        .languageCode,
                                  )
                                  ? FlutterFlowTheme.of(context)
                                  .alternate
                                  : FlutterFlowTheme.of(context)
                                  .primaryText),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ].addToStart(const SizedBox(height: 16.0)),
      ),
    );
  }
}
