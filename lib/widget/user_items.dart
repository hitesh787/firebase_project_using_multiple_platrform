import 'package:firebase_project_using_multiple_platrform/model/user_model.dart';
import 'package:firebase_project_using_multiple_platrform/screen/chat_screen/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;


class UserItems extends StatefulWidget {
  final UserModel user;
  const UserItems({super.key, required this.user});

  @override
  State<UserItems> createState() => _UserItemsState();
}

class _UserItemsState extends State<UserItems> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(userModel: widget.user)));
    },
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,backgroundImage: NetworkImage(widget.user.image),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CircleAvatar(
              radius: 5,backgroundColor: widget.user.isOnline ? Colors.green:  Colors.grey,
            ),
          ),
        ],
      ),
      title: Text(widget.user.name,style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
      subtitle: Text("Last Active : ${timeago.format(widget.user.lastActive)}",style: const TextStyle(fontSize: 15,color: Colors.grey,overflow: TextOverflow.ellipsis),),
    ),
  );
}
