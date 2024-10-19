
import 'package:flutter/material.dart';
import 'package:manuvs_calendar/model_and_themes/FlutterFlowTheme.dart';
import 'package:manuvs_calendar/model_and_themes/flultter_flow_model.dart';
import 'package:manuvs_calendar/model_and_themes/flutter_flow_helpers.dart';
import 'month_day_component_model.dart';
export 'month_day_component_model.dart';

class MonthDayComponentWidget extends StatefulWidget {
  const MonthDayComponentWidget({
    super.key,
    required this.day,
  });

  final String? day;

  @override
  State<MonthDayComponentWidget> createState() =>
      _MonthDayComponentWidgetState();
}

class _MonthDayComponentWidgetState extends State<MonthDayComponentWidget> {
  late MonthDayComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDayComponentModel());

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
      width: 30.0,
      height: 30.0,
      decoration: const BoxDecoration(),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          widget.day!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Inter',
            color: FlutterFlowTheme.of(context).secondaryText,
            fontSize: 12.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
