part of 'chat_chinese_notifier.dart';

class ChatState extends Equatable{
  ChatState({this.chatModelObj}); 
  ChatModel? chatModelObj;

  @override
  List<Object?> get props => [chatModelObj];
  ChatState copyWith({ChatModel? chatModelObj}) {
    return ChatState(
      chatModelObj: chatModelObj ?? this.chatModelObj,
    );
  }
}