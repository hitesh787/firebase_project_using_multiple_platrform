import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project_using_multiple_platrform/model/user_model.dart';
import 'package:firebase_project_using_multiple_platrform/provider/firebase_provider.dart';
import 'package:firebase_project_using_multiple_platrform/widget/user_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    Provider.of<FirebaseProvider>(context, listen: false).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Chat App",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded, color: Colors.black))
          ],
        ),
        backgroundColor: Colors.white,
        body: Consumer<FirebaseProvider>(builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => UserItems(user: value.users[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: value.users.length,
          );
        }));
  }
}

/// Two Sum
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> numMap = {};

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];

      if (numMap.containsKey(complement)) {
        return [numMap[complement]!, i];
      }

      numMap[nums[i]] = i;
    }

    return [];
  }
}
