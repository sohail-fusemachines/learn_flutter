import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/presentor/view/login.dart';
import 'package:fusemachines_app_1/presentor/view/sidenav.dart';
import 'package:fusemachines_app_1/presentor/view/user_list.dart';
import 'package:injectable/injectable.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidenav(onLogoutCallback: (){
        Navigator.of(context).pushNamedAndRemoveUntil(Login.routeName, (route) => false);
      },),
      appBar: AppBar(
        title: const Text("Fusemachines app"),
      ),
      body: listOfWidgets[_selectedBottomSheetIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home"),
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
}
