import 'package:bloc/bloc.dart';
import 'package:fusemachines_app_1/model/user.dart';
import 'package:fusemachines_app_1/model/user_list_api_response.dart';
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'user_list_state.dart';

@injectable
class UserListCubit extends Cubit<UserListState> {
  final AppRepository _repo;

  UserListCubit(this._repo) : super(UserListInitial());

  double _totalPage = 0;
  double _currentPage = 0;

  void getListOfUsers([double pageNumber = 1]) {

    if (state is UserListInitial) {
      emit(UserListLoading());
    }

    _repo.getListOfUsers(pageNumber).then(handlePageNumber).then((value) {
      switch (state.runtimeType) {
        case UserListError:
        case UserListLoading:
        case UserListInitial:
          {
            emit(UserListLoaded(value));
            break;
          }
        case UserListLoaded:
          {
            emit(UserListNextPage(value));
            break;
          }
        default:
          {
            emit(UserListLoaded(value));
          }
      }
    });
  }

  void selectedUser(User user){
    emit(UserListItemClicked(user));
  }

  void getNextPageOfUsers() {
    if (_currentPage < _totalPage) {
      getListOfUsers(_currentPage + 1);
    }
  }


  Future<List<User>> handlePageNumber(UserListApiResponse value) async {
    _totalPage = value.totalPages;
    _currentPage = value.page;
    return value.data;
  }
}
