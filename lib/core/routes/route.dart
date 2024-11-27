import 'package:bibliaexplica/app_widget.dart';
import 'package:bibliaexplica/core/routes/routes.dart';
import 'package:bibliaexplica/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  Routes.app: (context) => const AppWidget(),
  Routes.splashScreen: (context) => const SplashScreen(),
};
