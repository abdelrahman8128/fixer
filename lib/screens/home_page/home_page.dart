import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_app/cubit/cubit.dart';
import 'package:fixer_app/cubit/states.dart';
import 'package:fixer_app/screens/periodic_services/periodic_services.dart';
import 'package:fixer_app/variables/language/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  bool loading = false;

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(79, 0),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1, 0),
          end: Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();

    AppCubit.get(context).getCarByNumber(carNumber: AppCubit.get(context).loginByCodeModel!.data!.carNumber??'');

    _model = createModel(context, () => HomePageModel());


    setupAnimations(
      animationsMap.values.where((anim) =>
      anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

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

      },
      builder: (context, state) {

        return ConditionalBuilder(
            condition: state is AppGetCarByNumberLoadingState,
            builder: (context) => Center(child: CircularProgressIndicator(color: Colors.orange,)),
            fallback: (context) => SafeArea(
              top: true,
              child: loading?Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: SpinKitCubeGrid(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50,
                  ),
                ),
              ):SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Your Car',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Fleet Model 42',
                            style: FlutterFlowTheme.of(context).displaySmall.override(
                              fontFamily: 'Outfit',
                              /*color: FlutterFlowTheme.of(context).dark400,*/
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/865452244861.png',
                      width: MediaQuery.sizeOf(context).width,
                      height: 240,
                      fit: BoxFit.cover,
                    ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: LinearPercentIndicator(
                        percent: 0.4,
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        lineHeight: 24,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: Color(0xFFF68B1E),
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        barRadius: Radius.circular(40),
                        padding: EdgeInsets.zero,
                        isRTL: !engApp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /*Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            'Charge',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                        Text(
                          '70%',
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ],
                    ),*/
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Last Check',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                              Text(
                                dateTimeFormat(
                                    'd MMM y',
                                    DateTime(2024,1,13)),
                                style: FlutterFlowTheme.of(context).displaySmall.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Status',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                              Text(
                                'RePairing',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                    fontSize: 25
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0x9A090F13),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x43000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          /*Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/imageLogo@3x.png',
                            ),
                          ),
                        ],
                      ),
                    ),*/
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fixer Assistant',
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Lexend Deca',
                                          color: Color(0xB3FFFFFF),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '13/01/24 4:30pm',
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.getFont(
                                          'Lexend Deca',
                                          color: Color(0xB3FFFFFF),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'The Expected completion date is 15/01/24',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                            fontFamily: 'Outfit',
                                            /*color: FlutterFlowTheme.of(context)
                                        .alternate,*/
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 150,
                            decoration: BoxDecoration(
                              /*color: Color(0xffDF3F3F),*/
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFF68B1E),
                                    Color(0xffDF3F3F)
                                  ]
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x37000000),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                /*context.pushNamed(
                            'carDriving',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 250),
                              ),
                            },
                          );*/
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                    child: Icon(
                                      Icons.bolt,
                                      color: FlutterFlowTheme.of(context).alternate,
                                      size: 44,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                    child: AutoSizeText(
                                      '2',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                      child: Text(
                                        'Number of repairs',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Lexend Deca',
                                          color: Color(0xB3FFFFFF),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 150,
                            decoration: BoxDecoration(
                              /*color: Color(0xFFF68B1E),*/
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xffDF3F3F),
                                    Color(0xFFF68B1E),
                                  ]
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x39000000),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                  child: Icon(
                                    Icons.electric_car,
                                    color: FlutterFlowTheme.of(context).alternate,
                                    size: 44,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: AutoSizeText(
                                    '5',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).alternate,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                    child: Text(
                                      'number of cheks',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Color(0xB3FFFFFF),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xff04A24C),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x37000000),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PeriodicServices(),));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Icon(
                                  Icons.query_builder,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 30,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: AutoSizeText(
                                  '${AppCubit.get(context).getCarByNumberModel?.nextRepairDate?.day}/${AppCubit.get(context).getCarByNumberModel?.nextRepairDate?.month}/${AppCubit.get(context).getCarByNumberModel?.nextRepairDate?.year}',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .alternate,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0),
                                  child: Text(
                                    'Next Repair Date',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: Color(0xB3FFFFFF),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );
      },

    );

  }
}
