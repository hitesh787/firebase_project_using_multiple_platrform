import 'package:firebase_project_using_multiple_platrform/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../provider/firebase_provider.dart';
import '../../widget/chst_message_widget.dart';

class MessageScreen extends StatefulWidget {
  final UserModel userModel;

  const MessageScreen({super.key, required this.userModel});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black, shadows: [Shadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 25)], size: 30),
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.userModel.image),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Text(
                    widget.userModel.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    widget.userModel.isOnline ? "Online" : "Offline",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: widget.userModel.isOnline ? Colors.green : Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ChatMessagesWidget(
                receiverId: widget.userModel.uid,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: messageController,
                      decoration: InputDecoration(
                          hintText: "Types Messages", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.black))),
                    ),
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    radius: 20,
                    child: IconButton(
                        onPressed: () {
                          _sendText(context);
                        },
                        icon: const Icon(Icons.send_rounded),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Future<void> _sendText(BuildContext context) async {
    if (messageController.text.isNotEmpty) {
      await FirebaseProvider.addTextMessage(
        content: messageController.text,
        receiverId: widget.userModel.uid,
      );
      messageController.clear();
      FocusScope.of(context).unfocus();
    }
    FocusScope.of(context).unfocus();
  }
}
