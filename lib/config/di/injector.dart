import 'package:get_it/get_it.dart';

import 'modules/core_module.dart';
import 'modules/country_details_module.dart';
import 'modules/home_module.dart';

Injector injector = _ServiceLocator();

abstract class AppModuleProtocol {
  void registerDependencies();
}

abstract class Injector {
  void initializeDependencies();
  void registerSingleton<T extends Object>(T instance);
  void registerFactory<T extends Object>(T Function() constructor);
  void registerLazySingleton<T extends Object>(T Function() constructor);
  void registerFactoryParam<T extends Object, P1>(T Function(P1) constructor);

  T get<T extends Object>({dynamic param, String? instanceName});
}

class _ServiceLocator implements Injector {
  static final GetIt getIt = GetIt.instance;

  @override
  void initializeDependencies() {
    final appModules = <AppModuleProtocol>[CoreModule(), HomeModule(), CountryDetailsModule()];

    for (final module in appModules) {
      module.registerDependencies();
    }
  }

  @override
  T get<T extends Object>({param, String? instanceName}) {
    return getIt.get<T>(param1: param, instanceName: instanceName);
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    getIt.registerSingleton<T>(instance);
  }

  @override
  void registerFactory<T extends Object>(T Function() constructor) {
    getIt.registerFactory<T>(constructor);
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() constructor) {
    getIt.registerLazySingleton<T>(constructor);
  }

  @override
  void registerFactoryParam<T extends Object, P1>(T Function(P1) constructor) {
    getIt.registerFactoryParam<T, P1, void>((param, _) => constructor(param));
  }
}
