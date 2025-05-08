part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Country> countries;

  HomeSuccess({required this.countries});
}

final class HomeFailure extends HomeState {}
