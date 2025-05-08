import '../../../domain/models/country.dart';

sealed class CountryDetailsState {}

final class CountryDetailsInitial extends CountryDetailsState {
  final Country country;

  CountryDetailsInitial({required this.country});
}
