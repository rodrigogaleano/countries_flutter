import 'package:flutter/material.dart';

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
  }
}
