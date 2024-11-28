import 'package:flutter/material.dart';
import 'package:holy_blends_mobile/config/theme.dart';

import 'pages/homepage.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Holy Blends',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const HomePage(),
    },
  ));
}
