import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          itemBuilder: (ctx, index) => Text(documents[index]['text']),
          itemCount: documents.length,
        );
      },
    );
  }
}
