import '../../domain/models/country.dart';
import '../../utils/result.dart';
import '../api/api_provider.dart';
import '../api/endpoint.dart';

abstract interface class CountriesRepositoryProtocol {
  Future<Result<List<Country>>> getAllCountries();
  Future<Result<List<Country>>> searchCountries(String query);
  Future<Result<List<Country>>> searchCountriesByRegion(String region);
}

final class CountriesRepository implements CountriesRepositoryProtocol {
  final ApiProviderProtocol _apiProvider;

  CountriesRepository({required ApiProviderProtocol apiProvider}) : _apiProvider = apiProvider;

  @override
  Future<Result<List<Country>>> getAllCountries() async {
    final endpoint = Endpoint(path: '/all', method: 'GET');
    final result = await _apiProvider.request(endpoint: endpoint);

    switch (result) {
      case Ok():
        final countries = Country.fromJsonList(result.value);

        return Result.ok(countries);
      case Error():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<Country>>> searchCountries(String query) async {
    final endpoint = Endpoint(path: '/name/$query', method: 'GET');
    final result = await _apiProvider.request(endpoint: endpoint);

    switch (result) {
      case Ok():
        final countries = Country.fromJsonList(result.value);

        return Result.ok(countries);
      case Error():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<Country>>> searchCountriesByRegion(String region) async {
    final endpoint = Endpoint(path: '/region/$region', method: 'GET');
    final result = await _apiProvider.request(endpoint: endpoint);

    switch (result) {
      case Ok():
        final countries = Country.fromJsonList(result.value);

        return Result.ok(countries);
      case Error():
        return Result.error(result.error);
    }
  }
}
