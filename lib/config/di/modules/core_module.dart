import '../../../data/api/api_provider.dart';
import '../../../data/repositories/countries_repository.dart';
import '../injector.dart';

final class CoreModule extends AppModuleProtocol {
  @override
  void registerDependencies() {
    // MARK: - Singletons

    injector.registerSingleton<ApiProviderProtocol>(ApiProvider.instance);

    // MARK: - Repositories

    injector.registerFactory<CountriesRepositoryProtocol>(() {
      return CountriesRepository(apiProvider: injector.get<ApiProviderProtocol>());
    });
  }
}
