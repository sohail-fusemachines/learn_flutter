import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:fusemachines_app_1/presentor/view/sidenav.dart';
import 'package:fusemachines_app_1/presentor/view/user_details.dart';
import 'package:fusemachines_app_1/presentor/view/user_list.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/dashboard_view_model.dart';
import 'package:fusemachines_app_1/presentor/viewmodel/user_list_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";

  DashboardViewModel _viewModel;

  Dashboard(this._viewModel);

  @override
  State<StatefulWidget> createState() {
    return _DashboardState(_viewModel);
  }
}

class _DashboardState extends State<Dashboard> {
  int _selectedBottomSheetIndex = 0;

  DashboardViewModel _viewModel;

  late UserDetailModel _userDetailModel;

  _DashboardState(this._viewModel);

  final List<Widget> listOfWidgets = [
    getIt.get<UserList>(),
    Text("This is profile")
  ];

  void _goToUserDetails() {
    Navigator.of(context).pushNamed(UserDetails.routeName);
    this._userDetailModel.removeListener(_goToUserDetails);
  }

  void _observeOnUserDetailsAdded(UserDetailModel userDetailModel) {
        this._userDetailModel = userDetailModel;
        _userDetailModel.addListener(_goToUserDetails);
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<UserDetailModel>(builder: (context, value, child) {

      _observeOnUserDetailsAdded(value);
      return _getDashboardView();
    });
  }

  Widget _getDashboardView() => Scaffold(
        drawer: Sidenav(
          onLogoutCallback: () {
            _viewModel.clearSharedPrefs();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Login.routeName, (route) => false);
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
