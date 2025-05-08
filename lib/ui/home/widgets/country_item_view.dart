import 'package:flutter/material.dart';

import '../../../domain/models/country.dart';

class CountryItemView extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryItemView({required this.country, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [Image.network(country.flagPath), Text(country.name, style: const TextStyle(fontSize: 18))],
      ),
    );
  }
}
