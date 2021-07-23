import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/presentor/bloc/authentication/authentication_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';

import 'dashboard.dart';

@injectable
class Login extends StatefulWidget {
  static const routeName = "/login";

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void login(BuildContext context) {
    if (_formKey.currentState!.validate() == true) {
      context.read<AuthenticationBloc>().add(AuthenticationEvent.logIn(this._usernameController.text, this._passwordController.text));
    }
  }

  void goToDashboard() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return state.maybeMap(
              loading: (value) => _getLoginUi(),
              loggedIn: (value) => _getLoginUi(true),
              orElse: () => _getLoginUi());
        },
        listener: (context, state) {
          state.maybeWhen(orElse: () {},
            loggedIn: () {
              goToDashboard();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message)));
            },);
        },
      );

  Widget _getLoginUi([bool isLoading = false]) =>
      Scaffold(
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
                    child: Hero(
                        tag: "fusemachines_image",
                        child: Image.asset(
                          'assets/graphics/fuse_machines.png',
                          width: double.infinity,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Username"),
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter user name.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Password"),
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password.';
                          }
                          return null;
                        },
                      ),
                      margin: EdgeInsets.fromLTRB(0, 4, 0, 0)),
                  Container(
                    child: ConstrainedBox(
                        constraints:
                        BoxConstraints(minHeight: 48, maxHeight: 48),
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            width: double.infinity,
                            height: double.infinity,
                            child: isLoading
                                ? Align(
                              alignment: Alignment.center,
                              child: Wrap(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 160,
                                      child: Lottie.asset(
                                          "assets/lottie/loading-lottie.json"))
                                ],
                              ),
                            )
                                : MaterialButton(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blueAccent,
                              onPressed: () {
                                login(context);
                              },
                            ))),
                    margin: EdgeInsets.symmetric(vertical: 8),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget _getLoadingUi() =>
      Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ));
}
