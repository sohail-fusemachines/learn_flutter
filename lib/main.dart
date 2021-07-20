import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/presentor/bloc/authentication/authentication_bloc.dart';
import 'package:fusemachines_app_1/presentor/view/splash.dart';

import 'package:fusemachines_app_1/route/route_generator.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'presentor/bloc/user_list/user_list_bloc.dart';

@injectable
class MyApp extends StatelessWidget {

  RouteGenerator _routeGenerator;

  MyApp(this._routeGenerator);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserListBloc>(create: (context) => getIt<UserListBloc>(),),
        BlocProvider<AuthenticationBloc>(create: (context) => getIt<AuthenticationBloc>() ..add(HandlePreviouslyLoggedIn()),),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.blue,
            brightness: Brightness.light,
          ),
          primaryColor: Colors.blueAccent,
          primarySwatch: Colors.blue,
        ),
        initialRoute: Splash.routeName,

        onGenerateRoute: _routeGenerator.getRouteGenerator,
      ),
    );
  }
}

void main() async {
  handleError();
  startAppWithoutUi();
  await configureDependencies();
  runApp(getIt.get<MyApp>());
}

void handleError() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
}

void startAppWithoutUi() {
  WidgetsFlutterBinding.ensureInitialized()..scheduleWarmUpFrame();
}
