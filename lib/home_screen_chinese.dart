import 'package:LongLaoshi/presentation/chat_chinese_screen/chat_chinese_dart.dart';
import 'package:LongLaoshi/presentation/flashcards/flascards_chinese.dart';
import 'package:LongLaoshi/presentation/submenu/chinese_submenu/chinese_submenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenCN extends ConsumerStatefulWidget {
  const HomeScreenCN({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreenCN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          LearningChineseScreen(),
          FlashcardScreenCN(),
          ChatScreen(),
        ],
      ),
    );
  }
}
