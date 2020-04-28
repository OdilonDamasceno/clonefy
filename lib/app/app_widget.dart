import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      themeMode: ThemeMode.dark,
      theme: ThemeData.from(
        colorScheme: ColorScheme.dark(
          primary: Colors.grey[800],
          secondary: Colors.grey[800],
          surface: Colors.grey[800],
          secondaryVariant: Colors.grey[800],
          primaryVariant: Colors.grey[800],
          onPrimary: Colors.grey[800],
          onSecondary: Colors.grey[800],
          onSurface: Colors.grey[800],
        ),
      ),
      initialRoute: '/login',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
