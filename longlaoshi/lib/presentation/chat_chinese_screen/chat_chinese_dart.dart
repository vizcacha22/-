import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class ChatScreen extends ConsumerStatefulWidget{
  const ChatScreen({Key? key})
    : super(
      key: key,
      );
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen>{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 700.h,
          child: Column(
            children: [
              SizedBox(height: 12.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(

                  )) 
                )
            ],
          )
        ),
      ));
  }
}