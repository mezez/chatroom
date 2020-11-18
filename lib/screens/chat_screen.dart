import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/sEJazA42bMU3oyLpO3Rs/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          QuerySnapshot values = streamSnapshot.data;
          final documents = values.docs;
          print(values.docs.length);
          return ListView.builder(
              itemCount: values.docs.length,
              itemBuilder: (ctx, index) => Container(
                    padding: EdgeInsets.all(8),
                    child: Text(documents[index]['text']),
                  ));
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () async {}),
    );
  }
}
