import 'package:fixer_app/cubit/cubit.dart';
import 'package:fixer_app/cubit/states.dart';
import 'package:fixer_app/screens/login/login.dart';
import 'package:fixer_app/screens/onboarding/onboarding.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool onBoarding=CacheHelper.getDate('onBoarding')??true ;
  runApp( MyApp(onBoarding));
}

class MyApp extends StatelessWidget {
  bool onBoarding;
   MyApp(this.onBoarding);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterFlowTheme.of(context).primary = Color(0xFFF68B1E);

    return BlocProvider(create: (context) => AppCubit(),
    child: BlocConsumer<AppCubit,AppCubitStates>(
      listener: (BuildContext context, AppCubitStates state) {  },
      builder: (context, state) {
        return AdaptiveTheme(
          light: ThemeData(
            colorScheme: ColorScheme.light(primary: Colors.deepOrange),

            useMaterial3: true,
            brightness: Brightness.light,

          ),
          dark: ThemeData(
            colorScheme: ColorScheme.dark(primary: Colors.deepOrange),

            useMaterial3: true,
            brightness: Brightness.dark,

          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
            title: 'Fixer',
            theme: theme,
            darkTheme: darkTheme,
            home: onBoarding?Onboarding():Login(),
          ),
        );
      },

    )

      ,
    );


  }
}
