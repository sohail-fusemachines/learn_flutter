
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardViewModel{

  AppRepository _repository;

  DashboardViewModel(this._repository);

  void clearSharedPrefs(){
    _repository.clearPreferences();
  }


}