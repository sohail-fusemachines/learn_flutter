// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../data/local/local_data_source.dart' as _i7;
import '../data/local/prefs/prefs_helper.dart' as _i17;
import '../data/remote/remote_data_source.dart' as _i6;
import '../main.dart' as _i4;
import '../presentor/view/dashboard.dart' as _i12;
import '../presentor/view/login.dart' as _i13;
import '../presentor/view/splash.dart' as _i14;
import '../presentor/view/user_list.dart' as _i15;
import '../presentor/viewmodel/dashboard_view_model.dart' as _i8;
import '../presentor/viewmodel/login_view_model.dart' as _i9;
import '../presentor/viewmodel/splash_view_model.dart' as _i10;
import '../presentor/viewmodel/user_list_view_model.dart' as _i11;
import '../repository/app_repository.dart' as _i5;
import '../route/route_generator.dart' as _i3;
import 'modules/shared_pref_module.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.factory<_i3.RouteGenerator>(() => _i3.RouteGenerator());
  gh.factory<_i4.MyApp>(() => _i4.MyApp(get<_i3.RouteGenerator>()));
  gh.factory<_i5.AppRepository>(() => _i5.AppRepositoryImpl(
      get<_i6.RemoteDataSource>(), get<_i7.LocalDataSource>()));
  gh.factory<_i8.DashboardViewModel>(
      () => _i8.DashboardViewModel(get<_i5.AppRepository>()));
  gh.factory<_i9.LoginViewModel>(
      () => _i9.LoginViewModel(get<_i5.AppRepository>()));
  gh.factory<_i10.SplashViewModel>(
      () => _i10.SplashViewModel(get<_i5.AppRepository>()));
  gh.factory<_i11.UserListViewModel>(
      () => _i11.UserListViewModel(get<_i5.AppRepository>()));
  gh.factory<_i12.Dashboard>(
      () => _i12.Dashboard(get<_i8.DashboardViewModel>()));
  gh.factory<_i13.Login>(() => _i13.Login(get<_i9.LoginViewModel>()));
  gh.factory<_i14.Splash>(() => _i14.Splash(get<_i10.SplashViewModel>()));
  gh.factory<_i15.UserList>(() => _i15.UserList(get<_i11.UserListViewModel>()));
  gh.singleton<_i6.RemoteDataSource>(_i6.RemoteDataSourceImpl());
  await gh.singletonAsync<_i16.SharedPreferences>(
      () => sharedPreferencesModule.getSharedPreferences(),
      preResolve: true);
  gh.singleton<_i17.PeferencesHelper>(
      _i17.PeferencesHelperImpl(get<_i16.SharedPreferences>()));
  gh.singleton<_i7.LocalDataSource>(
      _i7.LocalDataSourceImpl(get<_i17.PeferencesHelper>()));
  return get;
}

class _$SharedPreferencesModule extends _i18.SharedPreferencesModule {}
