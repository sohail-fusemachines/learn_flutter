// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../app_view_model.dart' as _i9;
import '../data/local/local_data_source.dart' as _i8;
import '../data/local/prefs/prefs_helper.dart' as _i4;
import '../data/remote/remote_data_source.dart' as _i7;
import '../main.dart' as _i11;
import '../presentor/view/dashboard.dart' as _i3;
import '../presentor/view/login.dart' as _i15;
import '../presentor/view/splash.dart' as _i16;
import '../presentor/view/user_list.dart' as _i17;
import '../presentor/viewmodel/login_view_model.dart' as _i10;
import '../presentor/viewmodel/splash_view_model.dart' as _i13;
import '../presentor/viewmodel/user_list_view_model.dart' as _i14;
import '../repository/app_repository.dart' as _i6;
import '../route/route_generator.dart' as _i12;
import 'modules/shared_pref_module.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.factory<_i3.Dashboard>(() => _i3.Dashboard());
  gh.factory<_i4.PeferencesHelper>(() => _i4.PeferencesHelperImpl());
  gh.factoryAsync<_i5.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences);
  gh.factory<_i6.AppRepository>(() => _i6.AppRepositoryImpl(
      get<_i7.RemoteDataSource>(), get<_i8.LocalDataSource>()));
  gh.factory<_i9.AppViewModel>(
      () => _i9.AppViewModel(get<_i6.AppRepository>()));
  gh.factory<_i10.LoginViewModel>(
      () => _i10.LoginViewModel(get<_i6.AppRepository>()));
  gh.factory<_i11.MyApp>(
      () => _i11.MyApp(get<_i9.AppViewModel>(), get<_i12.RouteGenerator>()));
  gh.factory<_i13.SplashViewModel>(
      () => _i13.SplashViewModel(get<_i6.AppRepository>()));
  gh.factory<_i14.UserListViewModel>(
      () => _i14.UserListViewModel(get<_i6.AppRepository>()));
  gh.factory<_i15.Login>(() => _i15.Login(get<_i10.LoginViewModel>()));
  gh.factory<_i16.Splash>(() => _i16.Splash(get<_i13.SplashViewModel>()));
  gh.factory<_i17.UserList>(() => _i17.UserList(get<_i14.UserListViewModel>()));
  gh.singleton<_i7.RemoteDataSource>(_i7.RemoteDataSourceImpl());
  gh.singleton<_i12.RouteGenerator>(_i12.RouteGenerator());
  gh.singleton<_i8.LocalDataSource>(
      _i8.LocalDataSourceImpl(get<_i4.PeferencesHelper>()));
  return get;
}

class _$SharedPreferencesModule extends _i18.SharedPreferencesModule {}
