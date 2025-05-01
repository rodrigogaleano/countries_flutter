part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeSuccess extends HomeState {
  final List<Country> countries;

  const HomeSuccess({required this.countries});

  @override
  List<Object?> get props => [countries];
}

final class HomeFailure extends HomeState {
  const HomeFailure();
}
