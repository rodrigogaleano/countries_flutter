import '../../../data/repositories/countries_repository.dart';
import '../../../ui/home/cubit/home_cubit.dart';
import '../injector.dart';

final class HomeModule extends AppModuleProtocol {
  @override
  void registerDependencies() {
    injector.registerFactory<HomeCubit>(() {
      return HomeCubit(countriesRepository: injector.get<CountriesRepositoryProtocol>());
    });
  }
}
