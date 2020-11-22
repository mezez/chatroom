import 'package:chatroom/widgets/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: false)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        QuerySnapshot values = chatSnapshot.data;
        final documents = values.docs;
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          // reverse: true, //order messages, bottom top
          itemBuilder: (ctx, index) => MessageBubble(
            documents[index]['text'],
            documents[index]['userId'] == user.uid,
            key: ValueKey(documents[index].id),
          ),
          itemCount: documents.length,
        );
      },
    );
  }
}
