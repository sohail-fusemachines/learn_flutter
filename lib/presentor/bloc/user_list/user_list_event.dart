part of 'user_list_bloc.dart';

@freezed
class UserListEvent with _$UserListEvent {
  factory UserListEvent.getUserList() = _GetUserList;
  factory UserListEvent.selectUser(User user) = _SelectUser;
  factory UserListEvent.getNextPage() = _GetNextPage;

}

