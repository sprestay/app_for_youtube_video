import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTripWidget extends StatefulWidget {
  const CreateTripWidget({Key? key}) : super(key: key);

  @override
  _CreateTripWidgetState createState() => _CreateTripWidgetState();
}

class _CreateTripWidgetState extends State<CreateTripWidget> {
  DateTime? datePicked;
  TripRecord? trip;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        leading: FlutterFlowIconButton(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 30, 25, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Дата отправления:',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    InkWell(
                      onTap: () async {
                        await DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            setState(() => datePicked = date);
                          },
                          currentTime: getCurrentTimestamp,
                          minTime: getCurrentTimestamp,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Text(
                        'Выберите автомобиль:',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(),
                      child: AuthUserStreamWidget(
                        child: Builder(
                          builder: (context) {
                            final car =
                                (currentUserDocument?.listOfCars?.toList() ??
                                        [])
                                    .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: car.length,
                              itemBuilder: (context, carIndex) {
                                final carItem = car[carIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: StreamBuilder<CarUserRecord>(
                                    stream: CarUserRecord.getDocument(carItem),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      final containerCarUserRecord =
                                          snapshot.data!;
                                      return InkWell(
                                        onTap: () async {
                                          setState(() => FFAppState()
                                                  .choosenCar =
                                              containerCarUserRecord.reference);
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: carItem ==
                                                    FFAppState().choosenCar
                                                ? FlutterFlowTheme.of(context)
                                                    .inActiveColor
                                                : FlutterFlowTheme.of(context)
                                                    .white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image.network(
                                                containerCarUserRecord.image!,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${containerCarUserRecord.mark}, ${containerCarUserRecord.model}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Text(
                                                      containerCarUserRecord
                                                          .regNumber!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('AddCar');
                          },
                          text: 'Добавить машину',
                          options: FFButtonOptions(
                            width: 250,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final tripCreateData = createTripRecordData(
                            from: FFAppState().from,
                            to: FFAppState().to,
                            when: getCurrentTimestamp,
                            driver: currentUserReference,
                            car: FFAppState().choosenCar,
                          );
                          var tripRecordReference = TripRecord.collection.doc();
                          await tripRecordReference.set(tripCreateData);
                          trip = TripRecord.getDocumentFromData(
                              tripCreateData, tripRecordReference);

                          final usersUpdateData = {
                            'list_of_trips':
                                FieldValue.arrayUnion([trip!.reference]),
                          };
                          await currentUserReference!.update(usersUpdateData);
                          context.pop();

                          setState(() {});
                        },
                        text: 'Создать поездку',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Lato',
                                color: functions.checkCreateTrip(
                                        FFAppState().choosenCar,
                                        getCurrentTimestamp)
                                    ? FlutterFlowTheme.of(context).activeColor
                                    : FlutterFlowTheme.of(context)
                                        .inActiveColor,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
