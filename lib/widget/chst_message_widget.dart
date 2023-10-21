import 'package:firebase_project_using_multiple_platrform/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatMessagesWidget extends StatelessWidget {
  final String receiverId;
  ChatMessagesWidget({super.key, required this.receiverId});


  final message = [
    MessageModel(senderId: "2", receiverId: "rJjaowDj0BCHyxMIPSCI", content: "Hello", sentTime: DateTime.now(), messageType: MessageType.text),
    MessageModel(senderId: "rJjaowDj0BCHyxMIPSCI", receiverId: "2", content: "How are you", sentTime: DateTime.now(), messageType: MessageType.text),
    MessageModel(senderId: "2", receiverId: "rJjaowDj0BCHyxMIPSCI", content: "i ma fine", sentTime: DateTime.now(), messageType: MessageType.text),
    MessageModel(senderId: "rJjaowDj0BCHyxMIPSCI", receiverId: "rJjaowDj0BCHyxMIPSCI", content: "kya kar rahe ho ap", sentTime: DateTime.now(), messageType: MessageType.text),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: message.length,
          itemBuilder: (context, index) {
            final isMe = receiverId != message[index].senderId;
            return messageBubbleWidget(
              isMe: isMe,
              messageModel: message[index],
            );
          }),
    );
  }
}


/// Message Bubbles Widget
Widget messageBubbleWidget({required MessageModel messageModel, required bool isMe}) {
  return Align(
    alignment: isMe ? Alignment.topLeft : Alignment.topRight,
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      decoration: BoxDecoration(
          color: isMe ? Colors.grey : Colors.green,
          borderRadius: isMe
              ? const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomRight: Radius.circular(15))
              : const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            messageModel.content,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            timeago.format(messageModel.sentTime),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
