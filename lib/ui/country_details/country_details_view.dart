import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/injector.dart';
import '../../domain/models/country.dart';
import 'cubit/country_details_cubit.dart';
import 'cubit/country_details_state.dart';
import 'widgets/info_item_view.dart';

class CountryDetailsView extends StatefulWidget {
  final Country country;

  const CountryDetailsView({required this.country, super.key});

  @override
  State<CountryDetailsView> createState() => _CountryDetailsViewState();
}

class _CountryDetailsViewState extends State<CountryDetailsView> {
  late final CountryDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = injector.get<CountryDetailsCubit>(param: widget.country);
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
          SliverAppBar(title: Text('Country Details')),
          BlocBuilder<CountryDetailsCubit, CountryDetailsState>(
            bloc: cubit,
            builder: (_, state) {
              if (state is CountryDetailsInitial) {
                return SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList.list(
                    children: [
                      Image.network(state.country.flagPath, fit: BoxFit.cover),
                      SizedBox(height: 20),
                      InfoItemView(title: 'Name: ', value: state.country.name),
                      InfoItemView(
                        title: 'Capital: ',
                        value: state.country.capital ?? '',
                        isVisible: state.country.capital != null,
                      ),
                      InfoItemView(title: 'Region: ', value: state.country.region),
                      InfoItemView(
                        title: 'Subregion: ',
                        value: state.country.subregion ?? '',
                        isVisible: state.country.subregion != null,
                      ),
                      InfoItemView(title: 'Population: ', value: state.country.population.toString()),
                    ],
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
