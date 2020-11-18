import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (ctx, snapshot) {
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chats/sEJazA42bMU3oyLpO3Rs/messages')
                .snapshots(),
            builder: (ctx, streamSnapshot) {
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) => Container(
                        padding: EdgeInsets.all(8),
                        child: Text('This works'),
                      ));
            },
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () async {}),
    );
  }
}
