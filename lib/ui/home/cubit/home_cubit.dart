import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/countries_repository.dart';
import '../../../domain/models/country.dart';
import '../../../utils/result.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CountriesRepositoryProtocol _countriesRepository;

  HomeCubit({required CountriesRepositoryProtocol countriesRepository})
    : _countriesRepository = countriesRepository,
      super(HomeInitial());

  Future<void> fetchCountries() async {
    emit(HomeLoading());
    final result = await _countriesRepository.getAllCountries();

    switch (result) {
      case Ok():
        emit(HomeSuccess(countries: result.value));
      case Error():
        emit(HomeFailure());
    }
  }
}
