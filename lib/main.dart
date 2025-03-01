import 'package:flutter/material.dart';
import 'package:moving_square/ui/home_page.dart';
import 'constants/app_theme.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moving Squares',
      navigatorKey: navigatorKey,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
