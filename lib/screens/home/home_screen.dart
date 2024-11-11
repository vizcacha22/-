import 'package:LongLaoshi/screens/chat_chinese_screen/chat_chinese_dart.dart';
import 'package:LongLaoshi/screens/flashcards/flascards_chinese.dart';
import 'package:LongLaoshi/screens/flashcards/flashcards_japanese.dart';
import 'package:LongLaoshi/screens/profile/profile_screen.dart';
import 'package:LongLaoshi/screens/submenu/chinese_submenu/chinese_submenu.dart';
import 'package:LongLaoshi/screens/submenu/japanese_submenu/japanese_submenu.dart';
import 'package:LongLaoshi/screens/vocabulary/vocabulary_jp/level_selection_japanese.dart';
import 'package:LongLaoshi/screens/vocabulary/vocabulary_zh/level_selection_chinese.dart';
import 'package:flutter/material.dart';

abstract class LanguageScreens {
  List<Widget> get pages;
}

class JapaneseScreens implements LanguageScreens {
  @override
  List<Widget> get pages => [
        LearningJapaneseScreen(),
        FlashcardScreenJP(),
        LevelSelectionScreenJP(),
        ChatScreen(),
        ProfileScreen(),
      ];
}

class ChineseScreens implements LanguageScreens {
  @override
  List<Widget> get pages => [
        LearningChineseScreen(),
        FlashcardScreenCN(),
        LevelSelectionScreenZH(),
        ChatScreen(),
        ProfileScreen(),
      ];
}

enum Language { japanese, chinese }

LanguageScreens getScreensForLanguage(Language language) {
  switch (language) {
    case Language.japanese:
      return JapaneseScreens();
    case Language.chinese:
      return ChineseScreens();
    default:
      throw UnsupportedError("Language not supported");
  }
}

class HomeScreen extends StatelessWidget {
  final Language language;

  const HomeScreen({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screens = getScreensForLanguage(language).pages;

    return Scaffold(
      body: PageView(
        children: screens,
      ),
    );
  }
}
