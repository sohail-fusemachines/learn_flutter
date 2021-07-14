import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/presentor/cubit/authentication/authentication_cubit.dart';
import 'package:fusemachines_app_1/presentor/cubit/user_list/user_list_cubit.dart';
import 'package:fusemachines_app_1/presentor/view/splash.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/user_list_view_model.dart';
import 'package:fusemachines_app_1/route/route_generator.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class MyApp extends StatelessWidget {
  RouteGenerator _routeGenerator;

  MyApp(this._routeGenerator);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserListCubit>(create: (context) => getIt<UserListCubit>(),),
        BlocProvider<AuthenticationCubit>(create: (context) => getIt<AuthenticationCubit>(),),

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
        // this._viewModel.isUserLoggedIn ? UserList.routeName : Login.routeName,
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
