import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
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
    firstName: 'User',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Ryu',
    lastName: 'Laoshi',
    profileImage: 'assets/images/img_12fa4a85e35fafd.png',
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

  Future<void> loadThreadId() async {
    final prefs = await SharedPreferences.getInstance();
    final storedThreadId = prefs.getString('thread_id');

    if (storedThreadId != null) {
      setState(() {
        _threadId = storedThreadId;
      });
    } else {
      getThread();
    }
  }

  Future<void> getThread() async {
    final response = await http.get(Uri.parse(
        'https://longlaoshi-server.shuttleapp.rs/longlaoshi/create-conversation'));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final threadId = responseData['thread'];
      setState(() {
        _threadId = threadId;
      });

      // Save the thread ID to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('thread_id', threadId);
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
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: const Text('龙师 / 龍先生 (Profesor Dragón)'),
      ),
      body: Column(
        children: [
          SizedBox(height: 0.0),
          Container(
            margin: EdgeInsets.only(bottom: 0.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/img_12fa4a85e35fafd.png'),
                          radius: 30.0,
                          backgroundColor: Colors.grey[800],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Ryu Laoshi",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "こんにちは",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.red,
                                ),
                              ),
                            ],
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
              messageOptions: MessageOptions(
                currentUserContainerColor: Colors.grey.shade500,
                containerColor: Colors.grey[800]!,
                textColor: Colors.white,
                avatarBuilder: (user, onTap, longPress) {
                  return CircleAvatar(
                    backgroundImage: AssetImage(user.profileImage ?? 'assets/images/user_avatar.png'),
                  );
                },
              ),
              onSend: (ChatMessage m) {
                getChatResponse(m);
              },
              messages: _messages,
              typingUsers: _typingUsers,
              inputOptions: InputOptions(
                inputDecoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  hintText: "Escribe un mensaje",
                  hintStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                sendButtonBuilder: (void Function() onSend) {
                  return IconButton(
                    icon: Icon(Icons.send, color: Colors.grey),
                    onPressed: onSend,
                  );
                },
                inputTextStyle: TextStyle(color: Colors.blue.shade100),
              ),
              messageListOptions: MessageListOptions(
                typingBuilder: (context) {
                  return Row(
                    children: <Widget>[
                      Text(
                        "Ryu Laoshi está escribiendo",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(width: 6.0),
                      SizedBox(
                        width: 10.0,
                        height: 10.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: Colors.white70,
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
    );
  }
}
