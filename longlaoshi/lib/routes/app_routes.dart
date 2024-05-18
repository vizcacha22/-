import 'package:flutter/material.dart';
import '../presentation/inicio_screen/inicio_screen.dart'; // ignore_for_file: must_be_immutable

class AppRoutes {
  static const String inicioScreen = '/inicio_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    inicioScreen: (context) => InicioScreen(),
    initialRoute: (context) => InicioScreen()
  };
}
