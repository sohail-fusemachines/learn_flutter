import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fusemachines_app_1/di/application_component.dart';
import 'package:fusemachines_app_1/presentor/view/user_list.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
      switch(event.runtimeType){
        case DashboardBottomSheetIndexChangeEvent : {
          yield SelectedBottomSheetIndexState((event as DashboardBottomSheetIndexChangeEvent).selectedBottomSheetIndex);
        }
      }
  }
}
