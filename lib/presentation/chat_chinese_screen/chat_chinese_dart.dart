import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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
    loadMessages();
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
      saveMessages();
    });

    try {
      final response = await http.get(Uri.parse(
          'https://longlaoshi-server.shuttleapp.rs/longlaoshi/chat-with-your-own-assistant/$_threadId?msg=${Uri.encodeComponent(m.text)}'));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
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
            saveMessages();
          });
        } else {
          print('Error: Missing "response" field in JSON');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }

  Future<void> saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> messages = _messages.map((message) {
      return jsonEncode({
        'user': message.user.id,
        'text': message.text,
        'createdAt': message.createdAt.toIso8601String(),
      });
    }).toList();
    prefs.setStringList('chat_messages', messages);
  }

  Future<void> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? messages = prefs.getStringList('chat_messages');
    if (messages != null) {
      setState(() {
        _messages = messages.map((message) {
          final Map<String, dynamic> messageMap = jsonDecode(message);
          return ChatMessage(
            user: messageMap['user'] == '1' ? _user : _gptChatUser,
            text: messageMap['text'],
            createdAt: DateTime.parse(messageMap['createdAt']),
          );
        }).toList();
      });
    }
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
                              style: CustomTextStyles.displayMediumInterOnPrimary,
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
                        Text("Ryu Laoshi está escribiendo"),
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