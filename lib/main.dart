import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/app_view_model.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/presentor/view/dashboard.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:fusemachines_app_1/presentor/view/splash.dart';
import 'package:fusemachines_app_1/presentor/view/user_list.dart';
import 'package:fusemachines_app_1/route/route_generator.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class MyApp extends StatelessWidget {

  late AppViewModel _viewModel;
  late RouteGenerator _routeGenerator;

  MyApp(this._viewModel, this._routeGenerator);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          brightness: Brightness.light,
        ),
        primaryColor: Colors.blueAccent,
        primarySwatch: Colors.blue,
      ),
      initialRoute: Dashboard.routeName,
      // this._viewModel.isUserLoggedIn ? UserList.routeName : Login.routeName,
      onGenerateRoute: _routeGenerator.getRouteGenerator,
    );
  }
}

void main() async {
  await configureDependencies();
  runApp(getIt.get<MyApp>());
}
