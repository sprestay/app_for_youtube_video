import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SMSPageWidget extends StatefulWidget {
  const SMSPageWidget({Key? key}) : super(key: key);

  @override
  _SMSPageWidgetState createState() => _SMSPageWidgetState();
}

class _SMSPageWidgetState extends State<SMSPageWidget> {
  TextEditingController? pinCodeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                      child: Text(
                        'Код из смс',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Text(
                        'Введите номер телефона, отправленный на указанный номер телефона',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Lato',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: false,
                      autoFocus: true,
                      showCursor: true,
                      cursorColor: FlutterFlowTheme.of(context).primaryColor,
                      obscureText: false,
                      hintCharacter: '●',
                      pinTheme: PinTheme(
                        fieldHeight: 30,
                        fieldWidth: 30,
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(12),
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).textPassive,
                        inactiveColor:
                            FlutterFlowTheme.of(context).inActiveColor,
                        selectedColor: FlutterFlowTheme.of(context).activeColor,
                        activeFillColor:
                            FlutterFlowTheme.of(context).textPassive,
                        inactiveFillColor:
                            FlutterFlowTheme.of(context).inActiveColor,
                        selectedFillColor:
                            FlutterFlowTheme.of(context).activeColor,
                      ),
                      controller: pinCodeController,
                      onChanged: (_) => {},
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        final smsCodeVal = pinCodeController!.text;
                        if (smsCodeVal == null || smsCodeVal.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Enter SMS verification code.'),
                            ),
                          );
                          return;
                        }
                        final phoneVerifiedUser = await verifySmsCode(
                          context: context,
                          smsCode: smsCodeVal,
                        );
                        if (phoneVerifiedUser == null) {
                          return;
                        }

                        context.goNamedAuth('HomePage', mounted);
                      },
                      text: 'Подтвердить',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 46,
                        color: FlutterFlowTheme.of(context).activeColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
