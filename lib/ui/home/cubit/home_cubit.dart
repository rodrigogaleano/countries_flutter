import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/countries_repository.dart';
import '../../../domain/models/country.dart';
import '../../../utils/debounce.dart';
import '../../../utils/result.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
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

  void searchCountries(String query) {
    _debouncer.run(() async {
      if (query.isEmpty) {
        await fetchCountries();
        return;
      }

      emit(HomeLoading());
      final result = await _countriesRepository.searchCountries(query);

      switch (result) {
        case Ok():
          emit(HomeSuccess(countries: result.value));
        case Error():
          emit(HomeFailure());
      }
    });
  }

  @override
  Future<void> close() {
    _debouncer.cancel();
    return super.close();
  }
}
