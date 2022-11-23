import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCitiesWidget extends StatefulWidget {
  const EmptyCitiesWidget({Key? key}) : super(key: key);

  @override
  _EmptyCitiesWidgetState createState() => _EmptyCitiesWidgetState();
}

class _EmptyCitiesWidgetState extends State<EmptyCitiesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Text(
          'Данных не найдено',
          style: FlutterFlowTheme.of(context).title2,
        ),
      ),
    );
  }
}
