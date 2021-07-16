part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardBottomSheetIndexChangeEvent extends DashboardEvent {
  int _selectedBottomSheetIndex;

  int get selectedBottomSheetIndex => _selectedBottomSheetIndex;

  DashboardBottomSheetIndexChangeEvent(this._selectedBottomSheetIndex);
}
