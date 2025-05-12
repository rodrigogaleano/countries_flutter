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
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(country.flagPath, fit: BoxFit.cover, height: 120, width: 120),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(country.region, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
