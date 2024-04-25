// ignore_for_file: prefer_const_constructors

import 'package:chat_application/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatUserCard extends StatefulWidget {
  const chatUserCard({super.key});

  @override
  State<chatUserCard> createState() => _chatUserCardState();
}

class _chatUserCardState extends State<chatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width* .03, vertical: 4),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: (){},
        child: ListTile(
          leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
          title: Text('Random User'),
          subtitle: Text('Hello', maxLines: 2,),
          trailing: Text('2:00 PM' ,style: TextStyle(color: Colors.black, fontSize:13),),
        ),
      ),
    );
  }
}