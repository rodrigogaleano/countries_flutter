import 'package:flutter/material.dart';

import 'config/di/injector.dart';
import 'routing/app_router.dart';

void main() {
  injector.initializeDependencies();

  runApp(MaterialApp.router(routerConfig: AppRouter.router));
}
