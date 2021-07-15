part of 'user_list_bloc.dart';

@immutable
abstract class UserListState {}

class UserListInitial extends UserListState {}
class UserListLoading extends UserListState {
}
class UserListLoaded extends UserListState {
  final List<User> _listOfUsers;
  List<User> get listOfUser => this._listOfUsers;
  UserListLoaded(this._listOfUsers);
}

class UserListNextPage extends UserListState{
  final List<User> _listOfUsers;
  List<User> get listOfUser => this._listOfUsers;
  UserListNextPage(this._listOfUsers);
}

class UserListItemClicked extends UserListState{
  final User _user;
  User get user => _user;

  UserListItemClicked(this._user);
}

class UserListError extends UserListState {
  final String _errorMessage;
  String get errorMessage => _errorMessage;
  UserListError(this._errorMessage);

}

