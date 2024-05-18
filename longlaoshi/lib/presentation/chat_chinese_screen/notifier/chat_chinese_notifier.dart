import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/chat_chinese_model.dart';
part 'chinese_chat_state.dart';

final chatNotifier = StateNotifierProvider<ChatNotifier, ChatState>(
  (ref) => ChatNotifier(ChatState(chatModelObj:ChatModel(),
  )),
  );
class ChatNotifier extends StateNotifier<ChatState>{
  ChatNotifier(ChatState state) : super(state);
}