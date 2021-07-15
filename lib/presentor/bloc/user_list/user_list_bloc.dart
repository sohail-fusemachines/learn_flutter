import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fusemachines_app_1/model/user.dart';
import 'package:fusemachines_app_1/model/user_list_api_response.dart';
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

@injectable
class UserListBloc extends Bloc<UserListEvent, UserListState> {
  AppRepository _repo;
  UserListBloc(this._repo) : super(UserListInitial());

  @override
  Stream<UserListState> mapEventToState(
    UserListEvent event,
  ) async* {
      switch(event.runtimeType){
        case GetUserListEvent:{
          _getListOfUsers();
          break;
        }
        case SelectUserEvent:{
          _selectedUser((event as SelectUserEvent).user);
          break;
        }
        case NextPageEvent:{
          _getNextPageOfUsers();
          break;
        }
      }
  }

  double _totalPage = 0;
  double _currentPage = 0;

  void _getListOfUsers([double pageNumber = 1]) {

    if (state is UserListInitial) {
      emit(UserListLoading());
    }

    _repo.getListOfUsers(pageNumber).then(_handlePageNumber).then((value) {
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

  void _selectedUser(User user){
    emit(UserListItemClicked(user));
  }

  void _getNextPageOfUsers() {
    if (_currentPage < _totalPage) {
      _getListOfUsers(_currentPage + 1);
    }
  }


  Future<List<User>> _handlePageNumber(UserListApiResponse value) async {
    _totalPage = value.totalPages;
    _currentPage = value.page;
    return value.data;
  }
}
