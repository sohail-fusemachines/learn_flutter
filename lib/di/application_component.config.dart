// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../app_view_model.dart' as _i8;
import '../data/local/local_data_source.dart' as _i7;
import '../data/local/prefs/prefs_helper.dart' as _i4;
import '../data/remote/remote_data_source.dart' as _i6;
import '../main.dart' as _i11;
import '../presentor/view/dashboard.dart' as _i15;
import '../presentor/view/login.dart' as _i16;
import '../presentor/view/splash.dart' as _i17;
import '../presentor/view/user_list.dart' as _i18;
import '../presentor/viewmodel/dashboard_view_model.dart' as _i9;
import '../presentor/viewmodel/login_view_model.dart' as _i10;
import '../presentor/viewmodel/splash_view_model.dart' as _i13;
import '../presentor/viewmodel/user_list_view_model.dart' as _i14;
import '../repository/app_repository.dart' as _i5;
import '../route/route_generator.dart' as _i12;
import 'modules/shared_pref_module.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final sharedPreferencesModule = _$SharedPreferencesModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true);
  gh.factory<_i4.PeferencesHelper>(
      () => _i4.PeferencesHelperImpl(get<_i3.SharedPreferences>()));
  gh.factory<_i5.AppRepository>(() => _i5.AppRepositoryImpl(
      get<_i6.RemoteDataSource>(), get<_i7.LocalDataSource>()));
  gh.factory<_i8.AppViewModel>(
      () => _i8.AppViewModel(get<_i5.AppRepository>()));
  gh.factory<_i9.DashboardViewModel>(
      () => _i9.DashboardViewModel(get<_i5.AppRepository>()));
  gh.factory<_i10.LoginViewModel>(
      () => _i10.LoginViewModel(get<_i5.AppRepository>()));
  gh.factory<_i11.MyApp>(
      () => _i11.MyApp(get<_i8.AppViewModel>(), get<_i12.RouteGenerator>()));
  gh.factory<_i13.SplashViewModel>(
      () => _i13.SplashViewModel(get<_i5.AppRepository>()));
  gh.factory<_i14.UserListViewModel>(
      () => _i14.UserListViewModel(get<_i5.AppRepository>()));
  gh.factory<_i15.Dashboard>(
      () => _i15.Dashboard(get<_i9.DashboardViewModel>()));
  gh.factory<_i16.Login>(() => _i16.Login(get<_i10.LoginViewModel>()));
  gh.factory<_i17.Splash>(() => _i17.Splash(get<_i13.SplashViewModel>()));
  gh.factory<_i18.UserList>(() => _i18.UserList(get<_i14.UserListViewModel>()));
  gh.singleton<_i6.RemoteDataSource>(_i6.RemoteDataSourceImpl());
  gh.singleton<_i12.RouteGenerator>(_i12.RouteGenerator());
  gh.singleton<_i7.LocalDataSource>(
      _i7.LocalDataSourceImpl(get<_i4.PeferencesHelper>()));
  return get;
}

class _$SharedPreferencesModule extends _i19.SharedPreferencesModule {}
