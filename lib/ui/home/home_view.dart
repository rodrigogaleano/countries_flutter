import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/injector.dart';
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(title: Text('Home')),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return switch (state) {
                  HomeLoading() => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
                  HomeFailure() => const SliverFillRemaining(child: Center(child: Text('Error'))),
                  HomeSuccess(countries: final countries) => SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverList.separated(
                      itemCount: countries.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemBuilder: (_, index) => CountryItemView(country: countries[index]),
                    ),
                  ),
                  _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
