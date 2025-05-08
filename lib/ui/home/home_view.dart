import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/di/injector.dart';
import '../../routing/routes.dart';
import '../core/ui/error_placeholder.dart';
import '../core/ui/loading_placeholder.dart';
import 'cubit/home_cubit.dart';
import 'widgets/country_item_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cubit = injector.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.fetchCountries();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Home')),
          BlocBuilder<HomeCubit, HomeState>(
            bloc: cubit,
            builder: (_, state) {
              if (state is HomeLoading) {
                return const LoadingPlaceholder();
              }

              if (state is HomeFailure) {
                return const ErrorPlaceholder(message: 'Error');
              }

              if (state is HomeSuccess) {
                return SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList.separated(
                    itemCount: state.countries.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemBuilder: (_, index) {
                      return CountryItemView(
                        country: state.countries[index],
                        onTap: () => context.pushNamed(Routes.countryDetails, extra: state.countries[index]),
                      );
                    },
                  ),
                );
              }

              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
        ],
      ),
    );
  }
}
