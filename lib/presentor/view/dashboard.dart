import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/presentor/cubit/authentication/authentication_cubit.dart';
import 'package:fusemachines_app_1/presentor/cubit/user_list/user_list_cubit.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:fusemachines_app_1/presentor/view/sidenav.dart';
import 'package:fusemachines_app_1/presentor/view/user_details.dart';
import 'package:fusemachines_app_1/presentor/view/user_list.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";


  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  int _selectedBottomSheetIndex = 0;

  final List<Widget> listOfWidgets = [
    getIt.get<UserList>(),
    Text("This is profile")
  ];

  void _goToUserDetails() {
    Navigator.of(context).pushNamed(UserDetails.routeName);
  }

  void _logOut(){
    Navigator.of(context).pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }



  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(child: _getDashboardView(), listeners: [
      BlocListener<UserListCubit, UserListState>(
        listener: (context, state) {
        switch (state.runtimeType) {
          case UserListItemClicked:
            {
              _goToUserDetails();
              break;
            }
        }
      }),
      BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case AuthenticationLoggedOut:
                {
                  _logOut();
                  break;
                }
            }
          }),
    ],);

  }

  Widget _getDashboardView() =>
      Scaffold(
        drawer: Sidenav(
          onLogoutCallback: () {
            context.read<AuthenticationCubit>().logOut();
          },
        ),
        appBar: AppBar(
          title: const Text("Fusemachines app"),
        ),
        body: listOfWidgets[_selectedBottomSheetIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: (selectedIndex) {
            setState(() {
              _selectedBottomSheetIndex = selectedIndex;
            });
          },
          currentIndex: _selectedBottomSheetIndex,
        ),
      );


}
