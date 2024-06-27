import 'package:LongLaoshi/language_selection_screen.dart';
import 'package:LongLaoshi/presentation/chat_chinese_screen/chat_chinese_dart.dart';
import 'package:LongLaoshi/presentation/flashcards/flascards_chinese.dart';
import 'package:LongLaoshi/presentation/flashcards/flashcards_japanese.dart';
import 'package:LongLaoshi/presentation/auth/login_screen.dart';
import 'package:LongLaoshi/presentation/auth/registro_screen.dart';
import 'package:LongLaoshi/presentation/submenu/chinese_submenu/chinese_submenu.dart';
import 'package:LongLaoshi/presentation/submenu/japanese_submenu/japanese_submenu.dart';
import 'package:LongLaoshi/presentation/submenu/chinese_submenu/zh_capitulo1.dart';
import 'package:flutter/material.dart';
import '../presentation/inicio_screen/inicio_screen.dart';

class AppRoutes {
  static const String inicioScreen = '/inicio_screen';

  static const String chatScreen = '/chat_chinese_dart';

  static const String initialRoute = '/initialRoute';

  static const String flashcards_jp = "/flashcards_japanese";

  static const String flashcards_cn = "/flashcards_chinese";

  static const String loginScreen = "/login_screen";

  static const String registroScreen = "/registro_screen";

  static const String homeScreen = "/home_screen";

  static const String japanese = "/japanese";

  static const String chinese = "/chinese";

  static const String zh_chapter1 = "/zh_chapter1";

  static Map<String, WidgetBuilder> routes = {
    inicioScreen: (context) => InicioScreen(),
    initialRoute: (context) => InicioScreen(),
    chatScreen: (context) => ChatScreen(),
    flashcards_jp: (context) => FlashcardScreenJP(),
    flashcards_cn: (context) => FlashcardScreenCN(),
    loginScreen: (context) => LoginScreen(),
    registroScreen: (context) => RegistroScreen(),
    homeScreen: (context) => LanguageSelectionScreen(),
    japanese: (context) => LearningJapaneseScreen(),
    chinese: (context) => LearningChineseScreen(),
    zh_chapter1: (context) => ZhCapitulo1()
  };
}
