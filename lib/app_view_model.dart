
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppViewModel {

  AppRepository _repository;

  AppViewModel(this._repository);


}