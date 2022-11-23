import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTripWidget extends StatefulWidget {
  const SearchTripWidget({Key? key}) : super(key: key);

  @override
  _SearchTripWidgetState createState() => _SearchTripWidgetState();
}

class _SearchTripWidgetState extends State<SearchTripWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                  child: StreamBuilder<List<TripRecord>>(
                    stream: queryTripRecord(
                      queryBuilder: (tripRecord) => tripRecord
                          .where('FROM', isEqualTo: FFAppState().from)
                          .where('TO', isEqualTo: FFAppState().to),
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
                      List<TripRecord> listViewTripRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewTripRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewTripRecord =
                              listViewTripRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: InkWell(
                              onTap: () async {
                                context.pushNamed(
                                  'TripDetails',
                                  queryParams: {
                                    'trip': serializeParam(
                                      listViewTripRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'trip': listViewTripRecord,
                                  },
                                );
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      listViewTripRecord.from!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    Text(
                                      listViewTripRecord.to!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    Text(
                                      dateTimeFormat(
                                          'MMMEd', listViewTripRecord.when!),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
