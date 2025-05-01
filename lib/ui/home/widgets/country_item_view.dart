import 'package:flutter/material.dart';

import '../../../domain/models/country.dart';

class CountryItemView extends StatelessWidget {
  final Country country;

  const CountryItemView({required this.country, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.network(country.flagPath), Text(country.name, style: const TextStyle(fontSize: 18))],
    );
  }
}
