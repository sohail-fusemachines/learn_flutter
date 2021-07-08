
import 'package:fusemachines_app_1/model/user.dart';
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserListViewModel{
  final AppRepository _repo;

  UserListViewModel(this._repo);

  double _totalPage = 0;
  double _currentPage = 0;

  Future<List<User>> getListOfUsers([double pageNumber = 1]) => _repo.getListOfUsers(pageNumber).then((value) {
    _totalPage = value.total;
    _currentPage = value.page;
    return value.data;
    });


  Future<List<User>>? getNextPageOfUsers(){
    if(_currentPage < _totalPage ) {
      return getListOfUsers(_currentPage + 1);
    }
  }

  void clearPreferencecs(){
    _repo.clearPreferences();
  }

}