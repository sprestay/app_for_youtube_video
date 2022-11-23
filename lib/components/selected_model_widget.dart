import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedModelWidget extends StatefulWidget {
  const SelectedModelWidget({Key? key}) : super(key: key);

  @override
  _SelectedModelWidgetState createState() => _SelectedModelWidgetState();
}

class _SelectedModelWidgetState extends State<SelectedModelWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
      child: FutureBuilder<List<CarsRecord>>(
        future: queryCarsRecordOnce(
          queryBuilder: (carsRecord) =>
              carsRecord.where('mark', isEqualTo: FFAppState().selectedMark),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            );
          }
          List<CarsRecord> containerCarsRecordList = snapshot.data!;
          // Return an empty Container when the document does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final containerCarsRecord = containerCarsRecordList.isNotEmpty
              ? containerCarsRecordList.first
              : null;
          return Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 0),
              child: Builder(
                builder: (context) {
                  final model = containerCarsRecord!.models!.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: model.length,
                    itemBuilder: (context, modelIndex) {
                      final modelItem = model[modelIndex];
                      return InkWell(
                        onTap: () async {
                          setState(
                              () => FFAppState().selectedModel = modelItem);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: ListTile(
                          title: Text(
                            modelItem,
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
