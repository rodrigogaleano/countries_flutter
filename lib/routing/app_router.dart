import 'package:go_router/go_router.dart';

import '../domain/models/country.dart';
import '../ui/country_details/country_details_view.dart';
import '../ui/home/home_view.dart';
import 'routes.dart';

final class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        name: Routes.home,
        path: Routes.home,
        builder: (_, __) => const HomeView(),
        routes: [
          GoRoute(
            name: Routes.countryDetails,
            path: Routes.countryDetails,
            builder: (_, state) {
              return CountryDetailsView(country: state.extra as Country);
            },
          ),
        ],
      ),
    ],
  );
}
