import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/presentor/view/dashboard.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:fusemachines_app_1/presentor/view/user_list.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/splash_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class Splash extends StatefulWidget {
  static const String routeName ="/splash";
  SplashViewModel _viewModel;

  Splash(this._viewModel);

  @override
  State<StatefulWidget> createState() {
    return _SplashState(_viewModel);
  }
}

class _SplashState extends State<Splash> {


  SplashViewModel _viewModel;
  _SplashState(this._viewModel);

  @override
  void initState() {
   final isUserLoggedIn =  _viewModel.isUserLoggedIn();
    if(isUserLoggedIn){
      _goToDashboard();
    }else {
      _goToLogin();
    }
  }

  void _goToLogin(){
    Navigator.of(context).pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }

  void _goToDashboard(){
    Navigator.of(context).pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/graphics/fuse_machines.png'),
      ),
    );
  }
}
