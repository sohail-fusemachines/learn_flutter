import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/presentor/cubit/authentication/authentication_cubit.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/login_view_model.dart';
import 'package:injectable/injectable.dart';

import 'dashboard.dart';

@injectable
class Login extends StatefulWidget {
  static const routeName = "/login";

  LoginViewModel _viewModel;

  Login(this._viewModel);

  @override
  State<StatefulWidget> createState() => _LoginState(_viewModel);
}

class _LoginState extends State<Login> {
  LoginViewModel _viewModel;

  bool _isLoading = false;

  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _LoginState(this._viewModel);

  void login(BuildContext context) {
    if (_formKey.currentState!.validate() == true) {
      this._isLoading = true;
      context.read<AuthenticationCubit>().login(this._usernameController.text, this._passwordController.text);
    }
  }

  void goToDashboard() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          switch(state.runtimeType){
            case AuthenticationLoading: {
              return _getLoadingUi();
              break;
            }
          }
          return _getLoginUi();
        },
        listener: (context, state) {
          switch (state.runtimeType) {
            case AuthenticationLoggedIn:
              {
                goToDashboard();
                break;
              }
            case AuthenticationError:
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text((state as AuthenticationError).message)));
              }

          }
        },
      );

  Widget _getLoginUi() => Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 34),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/graphics/fuse_machines.png',
                      width: double.infinity,
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Username"),
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter user name.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password.';
                      }
                      return null;
                    },
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      width: double.infinity,
                      child: (_isLoading == false)
                          ? MaterialButton(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blueAccent,
                              onPressed: () {
                                login(context);
                              },
                            )
                          : Container(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(),
                            ))
                ],
              ),
            ),
          ),
        ),
      );

  Widget _getLoadingUi() => Center(child: CircularProgressIndicator(),);
}
