import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/injector.dart';
import 'cubit/home_cubit.dart';

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
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeFailure) {
              return const Center(child: Text('Error'));
            }

            if (state is HomeSuccess) {
              return ListView.builder(
                itemCount: state.countries.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(state.countries[index].name));
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
