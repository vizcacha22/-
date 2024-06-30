import 'package:LongLaoshi/presentation/chat_chinese_screen/chat_chinese_dart.dart';
import 'package:LongLaoshi/presentation/flashcards/flashcards_japanese.dart';
import 'package:LongLaoshi/presentation/profile/profile_screen.dart';
import 'package:LongLaoshi/presentation/submenu/japanese_submenu/japanese_submenu.dart';
import 'package:LongLaoshi/presentation/vocabulary/vocabulary_jp/level_selection_japanese.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenJP extends ConsumerStatefulWidget {
  const HomeScreenJP({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreenJP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          LearningJapaneseScreen(),
          FlashcardScreenJP(),
          LevelSelectionScreenJP(),
          ChatScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
