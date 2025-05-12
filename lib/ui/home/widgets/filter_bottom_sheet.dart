import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/enums/region_enum.dart';

class FilterBottomSheet extends StatelessWidget {
  final ValueChanged<String> onFilterSelected;

  const FilterBottomSheet({required this.onFilterSelected, super.key});

  static Future<void> show(BuildContext context, {required ValueChanged<String> onFilterSelected}) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => FilterBottomSheet(onFilterSelected: onFilterSelected),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
              RegionEnum.values.map((region) {
                return ListTile(
                  title: Text(region.description),
                  onTap: () {
                    onFilterSelected(region.name);
                    context.pop();
                  },
                );
              }).toList(),
        ),
      ),
    );
  }
}
