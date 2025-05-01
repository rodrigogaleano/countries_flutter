import 'package:flutter/material.dart';

import 'config/di/injector.dart';
import 'ui/home/home_view.dart';

void main() {
  injector.initializeDependencies();

  runApp(MaterialApp(title: 'Countries', home: const HomeView()));
}
