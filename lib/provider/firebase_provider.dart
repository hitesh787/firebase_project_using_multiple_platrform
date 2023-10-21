import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_using_multiple_platrform/model/message_model.dart';
import 'package:firebase_project_using_multiple_platrform/model/user_model.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  List<UserModel> users = [];

  List<UserModel> getAllUsers() {
    FirebaseFirestore.instance.collection("users").orderBy('lastActive', descending: true).snapshots(includeMetadataChanges: true).listen((users) {
      this.users = users.docs.map((doc) => UserModel.formJson(doc.data())).toList();
      notifyListeners();
    });
    return users;
  }

  static Future<void> addTextMessage({required String content, required String receiverId}) async {
    final messageModel = MessageModel(
      senderId: "FirebaseAuth.instance.currentUser!.uid",
      receiverId: receiverId,
      content: content,
      sentTime: DateTime.now(),
      messageType: MessageType.text,
    );
    await _addMessageToChat(receiverId,messageModel);
  }

  static Future<void> _addMessageToChat(
      String receiverId,
      MessageModel message
      ) async {
    await FirebaseFirestore.instance.collection('users').doc("FirebaseAuth.instance.currentUser!.uid").collection('chat').doc(receiverId).collection('message').add(message.toJson());

  }

}
