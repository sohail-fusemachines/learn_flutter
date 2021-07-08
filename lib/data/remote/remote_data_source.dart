import 'dart:convert';

import 'package:fusemachines_app_1/model/login_response.dart';
import 'package:fusemachines_app_1/model/user_list_api_response.dart';
import 'package:fusemachines_app_1/utils/const.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<UserListApiResponse> getListOfUsers(double pageNumber);
  Future<LoginResponse> login(String email, String password);
}

@Singleton(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<UserListApiResponse> getListOfUsers(double pageNumber) {
    final Future<http.Response> response =
        http.get(Uri.parse(BASE_URL + USERS_ENDPOINT + "?page=$pageNumber"));
    return response
        .then((value) => UserListApiResponse.fromJson(jsonDecode(value.body)));
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    final Future<http.Response> response = http.post(
        Uri.parse(BASE_URL + LOGIN_ENDPOINT),
        body: {"email": email, "password": password});

    return response
        .then((value) => LoginResponse.fromJson(jsonDecode(value.body)));
  }
}
