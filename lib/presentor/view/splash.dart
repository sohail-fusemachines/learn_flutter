import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/presentor/cubit/authentication/authentication_cubit.dart';
import 'package:fusemachines_app_1/presentor/view/dashboard.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:injectable/injectable.dart';

@injectable
class Splash extends StatefulWidget {
  static const String routeName ="/splash";


  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {

  void _goToLogin(){
    Navigator.of(context).pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }

  void _goToDashboard(){
    Navigator.of(context).pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // context.read<AuthenticationCubit>().handleUserLoggedIn();
   return BlocListener<AuthenticationCubit, AuthenticationState>(
     listener: (context, state) {
      switch(state.runtimeType){
        case AuthenticationLoggedIn: {
          _goToDashboard();
          break;
        }
        case AuthenticationLoggedOut: {
          _goToLogin();
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
