// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../app_view_model.dart' as _i8;
import '../data/local/local_data_source.dart' as _i7;
import '../data/local/prefs/prefs_helper.dart' as _i3;
import '../data/remote/remote_data_source.dart' as _i6;
import '../main.dart' as _i10;
import '../presentor/view/login.dart' as _i13;
import '../presentor/view/user_list.dart' as _i14;
import '../presentor/viewmodel/login_view_model.dart' as _i9;
import '../presentor/viewmodel/user_list_view_model.dart' as _i12;
import '../repository/app_repository.dart' as _i5;
import '../route/route_generator.dart' as _i11;
import 'modules/shared_pref_module.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.factory<_i3.PeferencesHelper>(() => _i3.PeferencesHelperImpl());
  gh.factoryAsync<_i4.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences);
  gh.factory<_i5.AppRepository>(() => _i5.AppRepositoryImpl(
      get<_i6.RemoteDataSource>(), get<_i7.LocalDataSource>()));
  gh.factory<_i8.AppViewModel>(
      () => _i8.AppViewModel(get<_i5.AppRepository>()));
  gh.factory<_i9.LoginViewModel>(
      () => _i9.LoginViewModel(get<_i5.AppRepository>()));
  gh.factory<_i10.MyApp>(
      () => _i10.MyApp(get<_i8.AppViewModel>(), get<_i11.RouteGenerator>()));
  gh.factory<_i12.UserListViewModel>(
      () => _i12.UserListViewModel(get<_i5.AppRepository>()));
  gh.factory<_i13.Login>(() => _i13.Login(get<_i9.LoginViewModel>()));
  gh.factory<_i14.UserList>(() => _i14.UserList(get<_i12.UserListViewModel>()));
  gh.singleton<_i6.RemoteDataSource>(_i6.RemoteDataSourceImpl());
  gh.singleton<_i11.RouteGenerator>(_i11.RouteGenerator());
  gh.singleton<_i7.LocalDataSource>(
      _i7.LocalDataSourceImpl(get<_i3.PeferencesHelper>()));
  return get;
}

class _$SharedPreferencesModule extends _i15.SharedPreferencesModule {}
