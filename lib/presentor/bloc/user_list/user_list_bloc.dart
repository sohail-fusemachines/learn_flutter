import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fusemachines_app_1/model/user.dart';
import 'package:fusemachines_app_1/model/user_list_api_response.dart';
import 'package:fusemachines_app_1/repository/app_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'user_list_bloc.freezed.dart';

part 'user_list_event.dart';

part 'user_list_state.dart';

@injectable
class UserListBloc extends Bloc<UserListEvent, UserListState> {
  AppRepository _repo;

  UserListBloc(this._repo) : super(UserListState.initial());

  @override
  Stream<UserListState> mapEventToState(
    UserListEvent event,
  ) async* {
    event.when(getUserList: () {
      _getListOfUsers();
    }, getNextPage: () {
      _getNextPageOfUsers();
    }, selectUser: (user) {
      _selectedUser(user);
    });
  }

  double _totalPage = 0;
  double _currentPage = 0;

  void _getListOfUsers([double pageNumber = 1]) {
    UserListState.loading();

    _repo.getListOfUsers(pageNumber).then(_handlePageNumber).then((value) {
      state.maybeWhen(
          onError: (error) => emit(UserListState.loaded(value)),
          loading: () => emit(UserListState.loaded(value)),
          initial: () => emit(UserListState.loaded(value)),
          orElse: () => emit(UserListState.loaded(value)),
          loaded: (previousPage) => emit(UserListState.nextPage(value)));
    });
  }

  void _selectedUser(User user) {
    emit(UserListState.onClick(user));
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
