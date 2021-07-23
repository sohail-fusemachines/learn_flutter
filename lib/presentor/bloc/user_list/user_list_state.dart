
part of 'user_list_bloc.dart';

@freezed
class UserListState with _$UserListState {
  factory UserListState.initial() = _Initial;
  factory UserListState.loading() = _Loading;
  factory UserListState.loaded(List<User> listOfUsers) = _Loaded;
  factory UserListState.nextPage(List<User> listOfUsers) = _NextPage;
  factory UserListState.onClick(User user) = _OnClick;
  factory UserListState.onError(String error) = _OnError;
}


