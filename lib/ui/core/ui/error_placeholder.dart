import 'package:flutter/widgets.dart';

class ErrorPlaceholder extends StatelessWidget {
  final String message;

  const ErrorPlaceholder({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(child: Center(child: Text(message)));
  }
}
