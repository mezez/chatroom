import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text('This works'),
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Firebase.initializeApp();
          FirebaseFirestore.instance
              .collection('chats/sEJazA42bMU3oyLpO3Rs/messages')
              .snapshots()
              .listen((data) {
            data.docs.forEach((document) {
              print(document['text']);
            });
          });
        },
      ),
    );
  }
}
