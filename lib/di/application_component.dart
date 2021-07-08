import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'application_component.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  generateForDir:const ['lib', 'test', 'lib/di/modules'] ,
  initializerName: r'$initGetIt',
)
Future<GetIt> configureDependencies()  async => await $initGetIt(getIt);