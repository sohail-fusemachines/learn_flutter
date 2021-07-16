part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  final List<Widget> _listOfWidgets = [
    getIt.get<UserList>(),
    Text("This is profile")
  ];

  abstract int _selectedBottomSheetIndex;

  int get selectedBottomSheetIndex => _selectedBottomSheetIndex;

  Widget getWidgetToShow();
}

class DashboardInitial extends DashboardState {
  @override
  int _selectedBottomSheetIndex = 0;

  @override
  Widget getWidgetToShow() {
    return _listOfWidgets.first;
  }
}

class SelectedBottomSheetIndexState extends DashboardState {
  SelectedBottomSheetIndexState(this._selectedBottomSheetIndex);

  @override
  int _selectedBottomSheetIndex;

  @override
  Widget getWidgetToShow() {
    return _listOfWidgets[_selectedBottomSheetIndex];
  }
}
