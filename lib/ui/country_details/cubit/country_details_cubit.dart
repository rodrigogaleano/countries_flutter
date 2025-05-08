import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/country.dart';
import 'country_details_state.dart';

final class CountryDetailsCubit extends Cubit<CountryDetailsState> {
  CountryDetailsCubit({required Country country}) : super(CountryDetailsInitial(country: country));
}
