part of 'user_list_bloc.dart';

@immutable
abstract class UserListEvent {}

class GetUserListEvent extends UserListEvent{}
class SelectUserEvent extends UserListEvent{
  User _user;
  User get user => _user;
  SelectUserEvent(this._user);
}
class NextPageEvent extends UserListEvent{}
