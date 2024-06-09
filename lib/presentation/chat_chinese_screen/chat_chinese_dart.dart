import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/app_export.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen> {
  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'Eduardo',
    lastName: 'Calle',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Ryu',
    lastName: 'Laoshi',
  );

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];
  late String _threadId;

  @override
  void initState() {
    super.initState();
    getThread();
  }

  Future<void> getThread() async {
    final response = await http.get(Uri.parse('https://longlaoshi-server.shuttleapp.rs/longlaoshi/create-conversation'));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final threadId = responseData['thread'];
      setState(() {
        _threadId = threadId;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });

    try {
      final response = await http.get(Uri.parse(
          'https://longlaoshi-server.shuttleapp.rs/longlaoshi/chat-with-your-own-assistant/$_threadId?msg=${Uri.encodeComponent(m.text)}'));

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        try {
          final responseData = jsonDecode(utf8.decode(response.bodyBytes)); // Ensure UTF-8 decoding
          if (responseData.containsKey('response')) {
            final botMessage = responseData['response'];

            setState(() {
              _messages.insert(
                0,
                ChatMessage(
                  user: _gptChatUser,
                  createdAt: DateTime.now(),
                  text: botMessage,
                ),
              );
            });
          } else {
            print('Error: Missing "response" field in JSON');
            print('Response body: ${response.body}');
          }
        } catch (e) {
          print('Error decoding JSON: $e');
          print('Response body: ${response.body}');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
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
              margin: EdgeInsets.only(bottom: 1.v),
              padding: EdgeInsets.symmetric(horizontal: 1.h),
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
                              style:
                                  CustomTextStyles.displayMediumInterOnPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                inputOptions: InputOptions(
                  inputDecoration: InputDecoration(
                    hintText: "Escribe un mensaje",
                  )
                ),
                messageListOptions: MessageListOptions(
                  typingBuilder: (context) {
                  return Row(
                  children: <Widget>[
                    Text("Ryu Laoshi esta escribiendo"),
                          SizedBox(width: 6.0.v),
                            SizedBox(
                              width: 10.0.v,
                              height: 10.0.h,
                              child: CircularProgressIndicator(
                              strokeWidth: 1.5.v,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
