import '../../../domain/models/country.dart';
import '../../../ui/country_details/cubit/country_details_cubit.dart';
import '../injector.dart';

final class CountryDetailsModule extends AppModuleProtocol {
  @override
  void registerDependencies() {
    injector.registerFactoryParam<CountryDetailsCubit, Country>((param) {
      return CountryDetailsCubit(country: param);
    });
  }
}
