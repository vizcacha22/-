import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/app_export.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

const OPENAI_API_KEY = "";

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

class ChatScreen extends ConsumerStatefulWidget{
  const ChatScreen({Key? key})
    : super(
      key: key,
      );

 class ChatScreenState extends ConsumerState<ChatScreen> {
  final OpenAI _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'Eduardo',
    lastName: 'Calle',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Chat',
    lastName: 'GPT',
  );

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  void initState() {
    super.initState();
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });

    List<Messages> messagesHistory = _messages.reversed.toList().map((m) {
      if (m.user == _user) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();

    final request = ChatCompleteText(
      messages: messagesHistory,
      maxToken: 200,
      model: GptTurbo0301ChatModel(),
    );

    final response = await _openAI.onChatCompletion(request: request);

    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content,
            ),
          );
        });
      }
    }

    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 12.v),
            Container(
              margin: EdgeInsets.only(bottom: 10.v),
              padding: EdgeInsets.symmetric(horizontal: 13.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.img12fa4a85e35fafd,
                            height: 123.v,
                            width: 116.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 17.h,
                              top: 49.v,
                              bottom: 24.v,
                            ),
                            child: Text(
                              "lbl".tr,
                              style: CustomTextStyles.displayMediumInterOnPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.v),
                  Text(
                    "msg_resuelve_tus_dudas".tr,
                    style: theme.textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: DashChat(
                currentUser: _user,
                messageOptions: const MessageOptions(
                  currentUserContainerColor: Colors.black,
                  containerColor: Color.fromRGBO(0, 166, 126, 1),
                  textColor: Colors.white,
                ),
                onSend: (ChatMessage m) {
                  getChatResponse(m);
                },
                messages: _messages,
                typingUsers: _typingUsers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}