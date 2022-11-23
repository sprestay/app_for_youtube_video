import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripDetailsWidget extends StatefulWidget {
  const TripDetailsWidget({
    Key? key,
    this.trip,
  }) : super(key: key);

  final TripRecord? trip;

  @override
  _TripDetailsWidgetState createState() => _TripDetailsWidgetState();
}

class _TripDetailsWidgetState extends State<TripDetailsWidget> {
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
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.trip!.from!,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      widget.trip!.to!,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      dateTimeFormat('MMMEd', widget.trip!.when!),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Водитель:',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(widget.trip!.driver!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final rowUsersRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  if (functions
                                      .photoIsEmpty(rowUsersRecord.photo!))
                                    Container(
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/circle_profile_photo.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (!functions
                                      .photoIsEmpty(rowUsersRecord.photo!))
                                    Container(
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/354/600',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rowUsersRecord.name!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Text(
                                    rowUsersRecord.phoneNumber!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Пассажиры:',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final pass = widget.trip!.passengers!.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: pass.length,
                          itemBuilder: (context, passIndex) {
                            final passItem = pass[passIndex];
                            return StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(passItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final rowUsersRecord = snapshot.data!;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          if (functions.photoIsEmpty(
                                              rowUsersRecord.photo!))
                                            Container(
                                              width: 120,
                                              height: 120,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/circle_profile_photo.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (!functions.photoIsEmpty(
                                              rowUsersRecord.photo!))
                                            Container(
                                              width: 120,
                                              height: 120,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                'https://picsum.photos/seed/354/600',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            rowUsersRecord.name!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Text(
                                            rowUsersRecord.phoneNumber!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 50, 25, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final tripUpdateData = {
                      'passengers':
                          FieldValue.arrayUnion([currentUserReference]),
                    };
                    await widget.trip!.reference.update(tripUpdateData);

                    final usersUpdateData = {
                      'list_of_trips':
                          FieldValue.arrayUnion([widget.trip!.reference]),
                    };
                    await currentUserReference!.update(usersUpdateData);

                    context.goNamed('HomePage');
                  },
                  text: 'Присоединиться',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).activeColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
