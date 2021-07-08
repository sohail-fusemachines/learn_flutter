import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fusemachines_app_1/data/remote/remote_data_source.dart';

RemoteDataSource _remoteDataSource = RemoteDataSourceImpl();

void main() {
  group("Login test.", () {
    test("Test for login.", () async {
      try {
        var response =
        await _remoteDataSource.login("eve.holt@reqres.in", "cityslicka");
        print("error: ${response.error} token: ${response.token}");
        if (response.error == null && response.token == null) {
          assert(false);
        }
        else {
          assert(true);
        }
      } catch(exception){
        print(exception);
        assert(false);
      }

    });
  });

 group("User list test.", (){
   test("Pagination test", () async {
     var response = await _remoteDataSource.getListOfUsers(1);

   });
 });
}
