import 'package:LongLaoshi/presentation/chat_chinese_screen/chat_chinese_dart.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/inicio_screen/inicio_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String inicioScreen = '/inicio_screen';

  static const String chatScreen = '/chat_chinese_dart';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    inicioScreen: (context) => InicioScreen(),
    initialRoute: (context) => InicioScreen(),
    chatScreen: (context) =>  ChatScreen(),
  };
}
