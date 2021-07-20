import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/model/user.dart';
import 'package:fusemachines_app_1/presentor/view/dashboard.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:fusemachines_app_1/presentor/view/splash.dart';
import 'package:fusemachines_app_1/presentor/view/user_details.dart';
import 'package:fusemachines_app_1/presentor/view/user_list.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RouteGenerator {

  Route<dynamic>? getRouteGenerator(RouteSettings settings) {
    switch (settings.name) {
      case Dashboard.routeName:
        return _getPageRouteBuilderForWidget(
            getIt.get<Dashboard>())
        ;
      case Splash.routeName:
        return _getPageRouteBuilderForWidget(
            getIt<Splash>());

      case UserList.routeName:
        return _getPageRouteBuilderForWidget(
          getIt<UserList>(),
        );

      case UserDetails.routeName:
        {
          return _getPageRouteBuilderForWidget(
              getIt<UserDetails>()
          );
        }

      case Login.routeName:
        return MaterialPageRoute(builder: (_) => getIt.get<Login>());
    }
  }

  Route<dynamic> _getPageRouteBuilderForWidget(Widget widget) {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 1.0);

        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        animation.drive(tween);
      return FadeTransition(opacity: animation,
      child: child,);
      },
      pageBuilder: (context, animation, secondaryAnimation) =>
          SafeArea(child: widget));
  }

  Route<dynamic> _getMaterialRoute(Widget widget) {
    return MaterialPageRoute(
        builder: (_) =>
            SafeArea(
              child: widget,
            )
    );
  }
}
