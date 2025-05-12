import 'package:flutter/material.dart';

class InfoItemView extends StatelessWidget {
  final bool isVisible;
  final String title;
  final String value;

  const InfoItemView({required this.title, required this.value, this.isVisible = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
          Text(value, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
