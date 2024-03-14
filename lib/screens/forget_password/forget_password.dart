import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_app/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../login/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var codeController = TextEditingController();

  var carIdChar = TextEditingController();

  var carIdNum = TextEditingController();


  final formKey = GlobalKey<FormState>();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return BlocConsumer<AppCubit,AppCubitStates>(
        listener: (context, state) {
          if (state is AppForgetPasswordErrorState)
            {
              showToast(state.error);
            }

        },
        builder: (context, state) {

          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ),
              title: Text(
                'Forgot Password',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            ),
            body: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                    child: TextFormField(
                      controller:codeController ,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Your Code...',
                        labelStyle: FlutterFlowTheme.of(context).bodySmall,
                        hintText: 'Enter your code here...',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: (value) {
                        if (value == null ||value.isEmpty)
                        {
                          return "Enter car code";
                        }
                        return null;
                      },

                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Car ID',
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: carIdChar,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Characters',
                              labelStyle: FlutterFlowTheme.of(context).bodySmall,
                              hintText: 'Enter characters here...',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value == null ||value.isEmpty)
                                {
                                  return "Enter car ID characters";
                                }
                              return null;
                            },

                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: carIdNum,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Numbers',
                              labelStyle: FlutterFlowTheme.of(context).bodySmall,
                              hintText: 'Enter numbers here...',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null ||value.isEmpty)
                              {
                                return "Enter car ID number";
                              }
                              return null;
                            },

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: ConditionalBuilder(
                        condition: state is AppForgetPasswordLoadingState,
                        builder: (context) => CircularProgressIndicator(color: Colors.orange,),
                        fallback: (context) {
                          return   FFButtonWidget(
                            onPressed: () {
                              if (formKey.currentState!.validate())
                              {
                                AppCubit.get(context).forgotPassword(carCode: codeController.text, carNumber: carIdNum.text+' '+carIdChar.text);

                              }

                            },
                            text: 'Send New Password',
                            options: FFButtonOptions(
                              width: 230,
                              height: 50,
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: Color(0xFFF68B1E),
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          );
                        },
                    ),

                  ),
                ],
              ),
            ),
          );
        },
    );

  }
}
