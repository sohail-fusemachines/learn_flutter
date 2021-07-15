import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/presentor/bloc/authentication/authentication_bloc.dart';
import 'package:fusemachines_app_1/presentor/view/dashboard.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:injectable/injectable.dart';

@injectable
class Splash extends StatelessWidget {
  static const String routeName ="/splash";
  void _goToLogin(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }

  void _goToDashboard(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
   return BlocListener<AuthenticationBloc, AuthenticationState>(
     listener: (context, state) {
      switch(state.runtimeType){
        case AuthenticationLoggedIn: {
          _goToDashboard(context);
          break;
        }
        case AuthenticationLoggedOut: {
          _goToLogin(context);
          break;
        }
      }
    }
    ,child: Scaffold(
        body: Center(
          child: Image.asset('assets/graphics/fuse_machines.png'),
        ),
      ),);

  }



}
