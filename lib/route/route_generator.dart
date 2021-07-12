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

@injectable
class RouteGenerator {

  Route<dynamic>? getRouteGenerator(RouteSettings settings) {
    switch (settings.name) {
      case Dashboard.routeName:
        return MaterialPageRoute(
            builder: (_) => SafeArea(child: getIt.get<Dashboard>()));
      case Splash.routeName:
        return MaterialPageRoute(
            builder: (_) => SafeArea(child: getIt<Splash>()));

      case UserList.routeName:
        return MaterialPageRoute(
            builder: (context) => SafeArea(
                  child: getIt<UserList>(),
                ));

      case UserDetails.routeName:
        {
          if (settings.arguments is User) {
            User user = settings.arguments as User;
            return MaterialPageRoute(
              builder: (_) => SafeArea(
                  child: UserDetails("${user.firstName} ${user.lastName}",
                      user.email, user.avatar)),
            );
          }
          break;
        }

      case Login.routeName:
        return MaterialPageRoute(builder: (_) => getIt.get<Login>());
    }
  }
}
